class GamesController < ApplicationController
  def show
  end

  def new
    @categories = Category.all
  end

  def create
    # Manipulating date time input to fit model
    @date = game_params[:date]
    @start_time = game_params[:start_time]
    @end_time = game_params[:end_time]

    @start = DateTime.parse(@date + ' ' + @start_time + "+08:00")
    @end = DateTime.parse(@date + ' ' + @end_time + "+08:00")

    @input_params = {"title" => game_params[:title], "venue" => game_params[:location], "players_required" => game_params[:players_required], "special_requirements" => game_params[:special_requirements], "start" => @start, "end" => @end, "category_id" => game_params[:category_id], "cost" => game_params[:cost]}

    # Need to add host ID into the params

    # Insert into database
    @game = Game.new(@input_params)
    @game.save
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
    def game_params
      params.require(:game).permit(:category_id, :title, :date, :start_time, :end_time, :location, :players_required, :special_requirements, :cost)
    end
end