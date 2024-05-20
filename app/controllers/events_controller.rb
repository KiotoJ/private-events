class EventsController < ApplicationController
  before_action :fetch_events, only: [:index]

  def index
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @users = User.all
  end

  def create
    user = User.find(event_params[:user_id])
    event = user.events.build(event_params)
    event.save
    render json: event
  end

  def create_attendee
    event = Event.find(params[:id])
    event.attendees << User.find(current_user.id)
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :event_date, :event_place)
  end

  def fetch_events
    @events = Event.all
  end
end
