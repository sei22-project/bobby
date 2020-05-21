class UsersController < ApplicationController
  before_action :check_user

  def show_dashboard
    ## This should show user dashboard.
    @participating_games = current_user.games
    @hosting_games = Game.where(host_id: current_user.id)
    #Edit links here for navbar
    @links = [{:name => "Home", :path => root_path}, {:name => "Host a Game", :path => new_game_path}, {:name => "Join a Game", :path => categories_path}]

  end

  def show_profile
    @links = [{:name => "Host a Game", :path => new_game_path}, {:name => "Join a Game", :path => categories_path}, {:name => "Dashboard", :path => dashboard_path}]
  end

  def edit
  end

  def update
  end

  private
    def check_user
      if !current_user
        redirect_to root_path
      end
    end
end