class GamesController < ApplicationController
  before_action :set_game

  def show

    #Select only pending requests
    @host_requests = @game.requests.select { |request| request.status == 3}

  end

  def new
  end

  def create
    @game = Game.new(game_params)

    # @game.save to be completed after time and date input finalised.
    # @game.save
  end

  def edit
  end

  def update
    @game.update(game_params)
  end

  def delete
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:title, :date, :start_time, :end_time, :location, :players_required, :special_requirements)
    end
end