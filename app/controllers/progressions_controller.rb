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
end
