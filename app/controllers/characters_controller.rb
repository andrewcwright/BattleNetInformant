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
    @character = current_user.characters.new( character_data )
    if @character.save
      flash[:notice] = "Character Saved"
      redirect_to :root
    else
      flash[:error] = "Could not create character"
      redirect_to :root
    end
  end

  def show
    @character = Character.find( params[:id] )
  end

  def destroy
    @character = Character.find( params[:id] )
    if @character.destroy
      flash[:notice] = "Character Deleted"
      redirect_to :root
    else
      flash[:error] = "Could not delete character"
      redirect_to :root
    end
  end

  def search
    @player1 = Character.find( params[:cid] )
    @player2 = BattleNetAPI.make_character( params[:name], params[:realm] )
    @versus = BattleNetAPI.versus( @player1, @player2 )
  end

end
