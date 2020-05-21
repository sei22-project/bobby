class RequestsController < ApplicationController
  before_action :set_request, only: [:destroy]

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    if @request.save
      game = Game.find(request_params[:game_id])
      redirect_to game_path(game)
    end
  end

  def update
    @request = Request.find(request_params[:id])

    if @request.update(request_params)
      game = Game.find(request_params[:game_id])
      if request_params[:status] == '1'
        user = User.find(request_params[:user_id])
        user.games.push(game)
      end
      redirect_to game_path(game)
    end

    # if request_params.status == 2
    #   Game.
    # end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    if @request.destroy
      redirect_to game_path(@request.game_id)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:user_id, :game_id, :status, :id)
    end
end