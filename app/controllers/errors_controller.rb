class ErrorsController < ApplicationController
   # skip_before_action :authenticate_user!

  def not_found
    @links = [{:name => "Home", :path => root_path},{:name => "Host a Game", :path => new_game_path}, {:name => "Dashboard", :path => dashboard_path}]

    respond_to do |format|
      format.html { render status: 404 }
    end
  end

  def unacceptable
    @links = [{:name => "Home", :path => root_path},{:name => "Host a Game", :path => new_game_path}, {:name => "Dashboard", :path => dashboard_path}]

    respond_to do |format|
      format.html { render status: 422 }
    end
  end

  def internal_error
    @links = [{:name => "Home", :path => root_path},{:name => "Host a Game", :path => new_game_path}, {:name => "Dashboard", :path => dashboard_path}]

    respond_to do |format|
      format.html { render status: 500 }
    end
  end
end