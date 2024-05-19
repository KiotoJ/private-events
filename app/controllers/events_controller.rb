class EventsController < ApplicationController
  def index
  end

  def create
    user = User.find(event_params[:user_id])
    event = user.events.build(event_params)
    event.save
    render json: event
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :event_date, :event_place)
  end
end
