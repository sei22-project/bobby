class GamesController < ApplicationController
  def show
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
  end

  def delete
  end

  private
    def game_params
      params.require(:game).permit(:title, :date, :start_time, :end_time, :location, :players_required, :special_requirements)
    end
end