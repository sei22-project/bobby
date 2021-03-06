class UsersController < ApplicationController
  before_action :check_user
  helper_method :group_by_day

  def show_dashboard


    @participating_games = group_by_day(current_user.games)
    @hosting_games = group_by_day(Game.where(host_id: current_user.id))
    #Edit links here for navbar
    @links = [{:name => "Home", :path => root_path}, {:name => "Host a Game", :path => new_game_path}, {:name => "Join a Game", :path => categories_path}]

  end

  def show_profile
    @user = current_user
    @links = [{:name => "Host a Game", :path => new_game_path}, {:name => "Join a Game", :path => categories_path}, {:name => "Dashboard", :path => dashboard_path}]
  end

  def edit
  end

  def update
    @user = current_user
    redirect_to profile_path if current_user.update(user_params)
  end

  private
    def check_user
      if !current_user
        redirect_to root_path
      end
    end

    def user_params
      params.require(:user).permit(:name, :avatar)
    end

    def group_by_day(obj) 
      sort_by_day = -> ( d ) {d.start.strftime("%A, %b %d %y")}
      return obj.group_by(&sort_by_day)
    end



end