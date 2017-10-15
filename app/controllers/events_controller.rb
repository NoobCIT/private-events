class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Event was made successfully'
      redirect_to @event.host
    else
      flash[:danger] = 'Event creation was unsuccessful'
      render 'new'
    end
  end

  def index
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  private

    def event_params
      params.require(:event).permit(:title, :location, :date)
    end
end
