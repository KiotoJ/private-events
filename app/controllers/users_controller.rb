class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = @user.events
    render json: @events
  end
end
