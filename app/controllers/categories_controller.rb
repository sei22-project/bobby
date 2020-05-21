class CategoriesController < ApplicationController
  require 'json'

  def index
    @games = Game.all
    @categories = Category.all
    #Edit links here for navbar
    @links = [{:name => "Home", :path => root_path},{:name => "Host a Game", :path => new_game_path}, {:name => "Dashboard", :path => dashboard_path}]
  end

  def sort
    puts JSON.parse(params.keys()[0])

  end

  def show
  end

  # private
  #   def sort_params
  #     params.require
  #   end

end