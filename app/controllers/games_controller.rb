class GamesController < ApplicationController
  before_action :set_game, except: [:new, :create]

  def show

    #Select only pending requests
    @host_requests = @game.requests.select { |request| request.status == 3}
    @rejected_request = current_user.requests.find {|request| request.status == 2 && request.game_id == @game.id}
    @pending_request = current_user.requests.find {|request| request.status == 3 && request.game_id == @game.id}
    @accepted_request = current_user.requests.find {|request| request.status == 1 && request.game_id == @game.id}
    # @request_made = current_user.requests.find {|request| request.game_id == @game.id}
    @room = Room.where(game_id: @game.id)[0]
    #Edit links here for navbar
    @links = [{:name => "Host a Game", :path => new_game_path}, {:name => "Join another Game", :path => categories_path}, {:name => "Dashboard", :path => dashboard_path}]
  end

  def new
    @categories = Category.all
    #Edit links here for navbar
    @links = [{:name => "Home", :path => root_path},{:name => "Join a Game", :path => categories_path}, {:name => "Dashboard", :path => dashboard_path}]
  end

  def create
    # Manipulating date time input to fit model
    @date = game_params[:date]
    @start_time = game_params[:start_time]
    @end_time = game_params[:end_time]

    @start = DateTime.parse(@date + ' ' + @start_time + "+08:00")
    @end = DateTime.parse(@date + ' ' + @end_time + "+08:00")

    @input_params = {"title" => game_params[:title], "venue" => game_params[:location], "players_required" => game_params[:players_required], "special_requirements" => game_params[:special_requirements], "start" => @start, "end" => @end, "category_id" => game_params[:category_id], "cost" => game_params[:cost], "host_id" => game_params[:host_id]}

    # Need to add host ID into the params

    # Insert into database
    @game = Game.new(@input_params)
    @game.save

    @newgame = Game.last
    Room.create(game_id: @newgame.id)

    redirect_to dashboard_path
  end

  def edit
    @categories = Category.all
  end

  def update
    # Manipulating date time input to fit model
    @date = game_params[:date]
    @start_time = game_params[:start_time]
    @end_time = game_params[:end_time]

    @start = DateTime.parse(@date + ' ' + @start_time + "+08:00")
    @end = DateTime.parse(@date + ' ' + @end_time + "+08:00")
    @input_params = {"title" => game_params[:title], "venue" => game_params[:location], "players_required" => game_params[:players_required], "special_requirements" => game_params[:special_requirements], "start" => @start, "end" => @end, "category_id" => game_params[:category_id], "cost" => game_params[:cost], "host_id" => game_params[:host_id]}

    @game.update(@input_params)
  end

  def destroy
    @game.destroy
    redirect_to dashboard_path
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:category_id, :title, :date, :start_time, :end_time, :location, :players_required, :special_requirements, :cost, :host_id)
    end
end