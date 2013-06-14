class CharactersController < ApplicationController
  require 'net/http'
  require 'json'

  def create
    @name = params[:character][:name]
    @realm = params[:character][:realm]
    character = format_character
    @character = current_user.characters.create( character )
    flash[:notice] = "Your Character has been added!"
    redirect_to :root
  end

  def get_character
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

  def format_character
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
    character = get_character
    character['character_class'] = classes[character['character_class']-1]
    character['race'] = races[character['race']]
    character['gender'] = character['gender'] == 0 ? "Male" : "Female"
    character
  end

end
