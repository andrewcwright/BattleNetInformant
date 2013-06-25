require 'net/http'
require 'json'
require 'battle_net_api'

class ProgressionsController < ApplicationController

  def create
    @character = Character.find( params[:character_id] )
    @name = params[:cname]
    @realm = params[:realm].gsub(/[^0-9a-z]/i, '').downcase
    @raid = params[:progression][:name]
    progression_data = BattleNetAPI.make_progression( @name, @realm, @raid )
    @progression = @character.progressions.new( progression_data )
    if @progression.save
      flash[:notice] = "Progression saved"
    else
      flash[:error] = "Could not save progression, please try again"
    end
    redirect_to :back
  end

  def edit
    old_progression = Progression.find( params[:character_id] )
    character = Character.find( old_progression.character_id )
    name = character.name
    realm = character.realm
    raid = old_progression.name
    new_progression = BattleNetAPI.make_progression( name, realm, raid )
    new_kills = BattleNetAPI.new_kills( old_progression, new_progression )
    if new_kills.length > 0
      new_kills.each do |new_kills|
        flash[:notice] = "#{new_kills}\n"
      end
    end
    old_progression = character.progressions.create( new_progression )
    redirect_to :back
  end

end
