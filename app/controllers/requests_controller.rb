class RequestsController < ApplicationController

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    @request.save
  end

  def update
    @request = Request.find(request_params[:id])

    if @request.update(request_params)
      if request_params[:status] == '1'
        game = Game.find(request_params[:game_id])
        user = User.find(request_params[:user_id])
        user.games.push(game)
      end
    end

    # if request_params.status == 2
    #   Game.
    # end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_request
    #   @request = Request.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:user_id, :game_id, :status, :id)
    end
end