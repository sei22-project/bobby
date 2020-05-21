class CategoriesController < ApplicationController
  require 'json'

  def index
    @games = Game.all
    @categories = Category.all
    #Edit links here for navbar
    @links = [{:name => "Home", :path => root_path},{:name => "Host a Game", :path => new_game_path}, {:name => "Dashboard", :path => dashboard_path}]
  end

  def sort
    # Parse string to hash
    sort_params = JSON.parse(params.keys()[0])

    # If sort by category
    if sort_params["date"] == ""
      @category = sort_params["category"].to_i
      @games = Game.where(category_id: @category)

      respond_to do |format|
        format.json {render :json => @games}
      end
    end

  end

  def show
  end

  # private
  #   def sort_params
  #     params.require
  #   end

end