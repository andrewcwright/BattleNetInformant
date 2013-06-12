class HomeController < ApplicationController

  def index
    @characters = Character.all
    @character = Character.new
  end

  def create
  end

end
