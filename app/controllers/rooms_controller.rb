class RoomsController < ApplicationController
  before_action :set_room
  before_action :auth_user

  def show
    #Edit links here for navbar
    @links = [{:name => "Host a Game", :path => new_game_path}, {:name => "Join a Game", :path => categories_path}, {:name => "Dashboard", :path => dashboard_path}]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    def auth_user
      if !@room.game.users.includes(current_user) || @room.game.host_id != @current_user.id
        redirect_to :root
      end
    end
end