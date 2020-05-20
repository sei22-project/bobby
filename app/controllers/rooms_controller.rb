class RoomsController < ApplicationController
  before_action :set_room

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

end