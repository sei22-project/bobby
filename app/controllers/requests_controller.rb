class RequestsController < ApplicationController

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    @request.save
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
      params.require(:message).permit(:user_id, :game_id)
    end
end