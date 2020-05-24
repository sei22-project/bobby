class CategoriesController < ApplicationController
  require 'json'

  def index
    # @games = Game.all
    @user_id = current_user[:id]
    @games = Game.where.not(host_id: @user_id).paginate(page: params[:page], per_page: 4)
    @categories = Category.all
    #Edit links here for navbar
    @links = [{:name => "Home", :path => root_path},{:name => "Host a Game", :path => new_game_path}, {:name => "Dashboard", :path => dashboard_path}]
  end

  def sort
    @categories = Category.all
    @user_id = current_user[:id]

    if params[:date] == "" and params[:category][:category_id] == ""
      @games = Game.where.not(host_id: @user_id).paginate(page: params[:page], per_page: 4)

    elsif params[:date] == ""
      @category_id = params[:category][:category_id].to_i
      @games = Game.where(category_id: @category_id).where.not(host_id: @user_id).paginate(page: params[:page], per_page: 4)
      respond_to do |format|
        format.js
      end

    elsif params[:category][:category_id] == ""
      date = Date.parse(params[:date])
      @games = Game.where(start: date.midnight..date.end_of_day).where.not(host_id: @user_id).paginate(page: params[:page], per_page: 4)

    else
      @category_id = params[:category][:category_id].to_i
      date = Date.parse(params[:date])
      @games = Game.where(category_id: @category_id, start: date.midnight..date.end_of_day).where.not(host_id: @user_id).paginate(page: params[:page], per_page: 4)
    end

  end

  def show
  end

end