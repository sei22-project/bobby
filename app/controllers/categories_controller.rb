class CategoriesController < ApplicationController
  require 'json'

  def index
    @games = Game.all
    @categories = Category.all
    #Edit links here for navbar
    @links = [{:name => "Home", :path => root_path},{:name => "Host a Game", :path => new_game_path}, {:name => "Dashboard", :path => dashboard_path}]
  end

  def sort
    sort_params = JSON.parse(params.keys()[0])

    if sort_params[:date] == ""
      purs sort_params[:category]
    end
  end

  def show
  end

  # private
  #   def sort_params
  #     params.require
  #   end

end