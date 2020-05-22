class HomeController < ApplicationController

  def index
    @games = Game.all
    @categories = Category.all
    #Edit links here for navbar
    @links = [{:name => "Host a Game", :path => new_game_path}, {:name => "Join a Game", :path => categories_path}, {:name => "Dashboard", :path => dashboard_path}]
  end

  def featured_games
    @featured_games =  Game.order(start: :desc).take(20)

    if @featured_games
      respond_to do |format|
        format.js { render partial: 'home/featured_games'}
      end
    else
      respond_to do |format|
        flash.now[:alert] = "No games available yet."
        format.js { render partial: 'home/featured_games'}
      end
    end
    

  end
end