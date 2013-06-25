module BattleNetAPI
  def self.make_character(name, realm)
    @name = name
    @realm = realm
    @stats = get_stats
    format_character
    add_base_stats
    add_pvp_stats
    @char
  end

  def self.make_progression(name, realm, raid)
    @name = name
    @realm = realm
    @progression = raid
    format_progression
    @progression_data = {}
    @progression_data['name'] = raid
    @progression_data['lfrBossesKilled'] = num_kills('lfr')
    @progression_data['normalBossesKilled'] = num_kills('normal')
    @progression_data['heroicBossesKilled'] = num_kills('heroic')
    @progression_data
  end

  def self.versus(player1, player2)
    versus = {}
    versus['higherHealthPlayer'] = player1.health > player2['health'] ? player1.name : player2['name']
    versus['higherDamagePlayer'] = player1.pvpPowerDamage > player2['pvpPowerDamage'] ? player1.name : player2['name']
    versus['higherHealingPlayer'] = player1.pvpPowerHealing > player2['pvpPowerHealing'] ? player1.name : player2['name']
    count = 0
    versus.each do |higherPlayer|
      if higherPlayer == player1.name
        count = count + 1
      end
    end
    versus['verdict'] = count > 1 ? "Fight" : "Run"
    versus
  end

  def self.get_character
    url = "http://us.battle.net/api/wow/character/#{@realm}/#{@name}"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new("/api/wow/character/#{@realm}/#{@name}")
    response = http.request(request)
    json_character = response.body
    parsed_character = JSON.parse(json_character)
    parsed_character['character_class'] = parsed_character['class']
    parsed_character.delete('class')
    parsed_character.delete('thumbnail')
    parsed_character.delete('calcClass')
    parsed_character.delete('lastModified')
    parsed_character
  end


  def self.format_character
    classes = [
      "Warrior", "Paladin", "Hunter", "Rogue", "Priest", "Death Knight",
      "Shaman", "Mage", "Warlock", "Monk", "Druid"
    ]
    races = {
      1 => "Human", 2 => "Orc", 3 => "Dwarf", 4 => "Night Elf", 5 => "Undead",
      6 => "Tauren", 7 => "Gnome", 8 => "Troll", 9 => "Goblin", 10 => "Blood Elf",
      11 => "Draenei", 22 => "Worgen", 24 => "Neutral Pandaren",
      25 => "Alliance Pandaren", 26 => "Horde Pandaren"
    }
    @char = get_character
    @char['character_class'] = classes[@char['character_class']-1]
    @char['race'] = races[@char['race']]
    @char['gender'] = @char['gender'] == 0 ? "Male" : "Female"
  end

  def self.get_progression
    url = "http://us.battle.net/api/wow/character/#{@realm}/#{@name}?fields=progression"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new("/api/wow/character/#{@realm}/#{@name}?fields=progression")
    response = http.request(request)
    json_character = response.body
    parsed_character = JSON.parse(json_character)
  end

  def self.format_progression
    progression_data = get_progression['progression']['raids']
    this_progression = {}
    progression_entries = progression_data.length
    progression_entries.times do |index|
      if progression_data[index]['name'] == @progression
        this_progression = progression_data[index]
      end
    end
    @raid = this_progression
  end

  def self.get_stats
    url = "http://us.battle.net/api/wow/character/#{@realm}/#{@name}?fields=stats"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new("/api/wow/character/#{@realm}/#{@name}?fields=stats")
    response = http.request(request)
    json_stats = response.body
    parsed_stats = JSON.parse(json_stats)
    parsed_stats['stats']
  end

  def self.add_base_stats
    @char['health'] = @stats['health']
    power_type = @stats['powerType']
    power_type = power_type.to_s.capitalize
    @char['powerType'] = power_type
    @char['power'] = @stats['power']
    @char['strength'] = @stats['str']
    @char['agility'] = @stats['agi']
    @char['stamina'] = @stats['sta']
    @char['intellect'] = @stats['int']
    @char['spirit'] = @stats['spr']
    @char['mastery'] = @stats['mastery']
  end

  def self.add_pvp_stats
    @char['pvpResilience'] = @stats['pvpResilience']
    @char['pvpPower'] = @stats['pvpPower']
    @char['pvpPowerDamage'] = @stats['pvpPowerDamage']
    @char['pvpPowerHealing'] = @stats['pvpPowerHealing']
  end

  def self.num_kills game_mode
    difficulty = 'lfrKills' if game_mode == 'lfr'
    difficulty = 'normalKills' if game_mode == 'normal'
    difficulty = 'heroicKills' if game_mode == 'heroic'
    raid_bosses = @raid['bosses'].length
    num_kills = 0
    raid_bosses.times do |index|
      if !@raid['bosses'][index][difficulty].nil? and @raid['bosses'][index][difficulty] > 0
        num_kills += 1
      end
    end
    num_kills
  end

  def self.new_kills(old_prog, new_prog)
    new_kills = {}
    if new_prog['lfrBossesKilled'] > old_prog.lfrBossesKilled
      dif = new_prog['lfrBossesKilled'] - old_prog.lfrBossesKilled
      new_kills['lfr'] = "Your have killed #{dif} new bosses in LFR difficulty"
    end
    if new_prog['normalBossesKilled'] > old_prog.normalBossesKilled
      dif = new_prog['normalBossesKilled'] - old_prog.normalBossesKilled
      new_kills['normal'] = "Your have killed #{dif} new bosses in normal difficulty"
    end
    if new_prog['heroicBossesKilled'] > old_prog.heroicBossesKilled
      dif = new_prog['heroicBossesKilled'] - old_prog.heroicBossesKilled
      new_kills['heroic'] = "Your have killed #{dif} new bosses in heroic difficulty"
    end
    new_kills
  end
end