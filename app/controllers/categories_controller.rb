class CategoriesController < ApplicationController
  def index
    @games = Game.all
    @categories = Category.all
  end

  def show
  end

end