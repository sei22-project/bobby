class UsersController < ApplicationController
  before_action :check_user
  def show
    ## This should show user dashboard.
    current_user
  end

  def edit
  end

  def update
  end

  private
    def check_user
      if current_user != User.find(params[:id])
        redirect_to root_path
      end
    end
end