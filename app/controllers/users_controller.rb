class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = @user.events
  end

  def index
    @users = User.all
  end
end
