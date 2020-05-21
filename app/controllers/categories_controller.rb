class CategoriesController < ApplicationController
  require 'json'

  def index
    @games = Game.all
    @categories = Category.all
    #Edit links here for navbar
    @links = [{:name => "Home", :path => root_path},{:name => "Host a Game", :path => new_game_path}, {:name => "Dashboard", :path => dashboard_path}]
  end

  def sort
    @categories = Category.all

    if params[:date] == ""
      @category_id = params[:category][:category_id].to_i
      @games = Game.where(category_id: @category_id)
      respond_to do |format|
        format.js
      end
    end

  end

  def show
  end

end