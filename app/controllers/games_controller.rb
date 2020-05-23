class GamesController < ApplicationController
  before_action :set_game, except: [:new, :create]
  before_action :authenticate_user!

  def show

    #Check if game is full (by checking accepted requests)
    @game_open = @game.requests.where(status: 1).count < @game.players_required

    #Select only pending requests
    @host_requests = @game.requests.select { |request| request.status == 3}
    @rejected_request = current_user.requests.find {|request| request.status == 2 && request.game_id == @game.id}
    @pending_request = current_user.requests.find {|request| request.status == 3 && request.game_id == @game.id}
    @accepted_request = current_user.requests.find {|request| request.status == 1 && request.game_id == @game.id}
    @user_in_game = @game.users.find {|user| user.id == current_user.id}
    # @request_made = current_user.requests.find {|request| request.game_id == @game.id}
    @room = Room.where(game_id: @game.id)[0]
    #Edit links here for navbar
    @links = [{:name => "Host a Game", :path => new_game_path}, {:name => "Join another Game", :path => categories_path}, {:name => "Dashboard", :path => dashboard_path}]
  end

  def new
    @categories = Category.all
    #Edit links here for navbar
    @links = [{:name => "Home", :path => root_path},{:name => "Join a Game", :path => categories_path}, {:name => "Dashboard", :path => dashboard_path}]

    @game_params = {"title" => "", "location" => "", "players_required" => "", "special_requirements" => "", "cost" => "", "date" => "", "start_time" => "", "end_time" => ""}
  end

  def create
    # Manipulating date time input to fit model
    @date = game_params[:date]
    @start_time = game_params[:start_time]
    @end_time = game_params[:end_time]

    if @date == ""
      @start = ""
    elsif @start_time == ""
      @start = ""
      @end = @end_time
    elsif @end_time == ""
      @end = ""
      @start = @start_time
    else
      @start = DateTime.parse(@date + ' ' + @start_time)
      @end = DateTime.parse(@date + ' ' + @end_time)
    end

    @input_params = {"title" => game_params[:title], "venue" => game_params[:location], "players_required" => game_params[:players_required], "special_requirements" => game_params[:special_requirements], "start" => @start, "end" => @end, "category_id" => game_params[:category_id], "cost" => game_params[:cost], "host_id" => game_params[:host_id]}

    # Need to add host ID into the params

    # Insert into database
    @game = Game.new(@input_params)

    if @game.valid?
      @game.save

      @newgame = Game.last
      Room.create(game_id: @newgame.id)

      redirect_to dashboard_path
    else
      @categories = Category.all
      @links = [{:name => "Home", :path => root_path},{:name => "Join a Game", :path => categories_path}, {:name => "Dashboard", :path => dashboard_path}]
      @game_params = game_params
      render 'new'
    end

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

    redirect_to game_path(@game)
  end

  def destroy
    @game.destroy
    redirect_to dashboard_path
  end

  def remove_games_users

    if current_user != User.find(@game.host_id)
      @game.users.delete(User.find(params[:user_id]))
      if User.find(params[:user_id]).requests.where(game_id: @game.id, status: 1)[0]
        if User.find(params[:user_id]).requests.where(game_id: @game.id, status: 1)[0].update(status: 0)
          redirect_to game_path(@game)
        end
      end
    else
      @game.users.delete(User.find(params[:user_id]))
      if User.find(params[:user_id]).requests.where(game_id: @game.id, status: 1)[0]
        if User.find(params[:user_id]).requests.where(game_id: @game.id, status: 1)[0].update(status: -1)
          redirect_to game_path(@game)
        end
      end
    end
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:category_id, :title, :date, :start_time, :end_time, :location, :players_required, :special_requirements, :cost, :host_id)
    end
end