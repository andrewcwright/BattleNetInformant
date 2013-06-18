module BattleNetAPI
  def self.make_character(name, realm)
    @name = name
    @realm = realm
    @stats = get_stats
    format_character
    add_base_stats
    add_pvp_stats
    @character
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
    @character = get_character
    @character['character_class'] = classes[@character['character_class']-1]
    @character['race'] = races[@character['race']]
    @character['gender'] = @character['gender'] == 0 ? "Male" : "Female"
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
    @character['health'] = @stats['health']
    power_type = @stats['powerType']
    power_type = power_type.to_s.capitalize
    @character['powerType'] = power_type
    @character['power'] = @stats['power']
    @character['strength'] = @stats['str']
    @character['agility'] = @stats['agi']
    @character['stamina'] = @stats['sta']
    @character['intellect'] = @stats['int']
    @character['spirit'] = @stats['spr']
    @character['mastery'] = @stats['mastery']
  end

  def self.add_pvp_stats
    @character['pvpResilience'] = @stats['pvpResilience']
    @character['pvpPower'] = @stats['pvpPower']
    @character['pvpPowerDamage'] = @stats['pvpPowerDamage']
    @character['pvpPowerHealing'] = @stats['pvpPowerHealing']
  end
end