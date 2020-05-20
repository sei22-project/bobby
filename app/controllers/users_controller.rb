class UsersController < ApplicationController
  before_action :check_user

  def show_dashboard
    ## This should show user dashboard.
    @participating_games = current_user.games
    @hosting_games = current_user.games.select {|game| game.host_id != current_user.id}

  end

  def show_profile
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