class EventsController < ApplicationController
  before_action :require_user, only: [:new, :create]

  #list all events
  def index
    @events = Event.where("end_time > ? ", Time.now)
  end

  def new
    @events = Event.all
    @categories = Category.where(cat_type: 'Event')
  end

  #create event
  def create
    @event = Event.new(event_params)
    @event.user_id = session[:user_id]
    @event.enabled = 1
    @event.save
    redirect_to @event
  end

  #show single event
  def show
    @event = Event.find(params[:id])
    @event_comment = EventComment.new
    @event_comments = EventComment.all
    #@category = Category.find(@event.cat_id)
  end

  #create new event from parameters
  private
  def event_params
    params.require(:event).permit(:name, :place_id, :description, :start_time, :end_time)
  end

end
