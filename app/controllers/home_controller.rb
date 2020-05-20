class HomeController < ApplicationController

  def index
    @games = Game.all
    @categories = Category.all
  end
end