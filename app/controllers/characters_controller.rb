require 'net/http'
require 'json'
require 'battle_net_api'

class CharactersController < ApplicationController
  def index
    @characters = Character.all
    @character = Character.new
    @accordion = 1
  end

  def create
    @name = params[:character][:name]
    @realm = params[:character][:realm]
    character_data = BattleNetAPI.make_character( @name, @realm )
    @character = current_user.characters.create( character_data )
    flash[:notice] = "#{character_data}"
    redirect_to :root
  end

end
