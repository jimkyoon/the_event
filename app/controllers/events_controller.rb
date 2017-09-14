class EventsController < ApplicationController

  # what to load on the main events page
  def main
    # info to display about current user
    @user = current_user
    # events that current user is not hosting
    @event = Event.where.not(user_id: current_user.id)
    # events that current user is hosting
    @hosting = Event.where(user_id: current_user.id)
    # google maps api to show events that current user can go to (not their own by the way)
    @hash = Gmaps4rails.build_markers(@event) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
    end
  end

  # load the add event page
  def new
  end

  # load the next page, which is to add the items for the event
  def new2
    @item = Item.where(event_id: Event.last.id)
    @itemevent = Event.last.id
  end

  # event view page info
  def show
    @event = Event.find(params[:id])
    @item = Item.where(event_id: params[:id])
    @attendees = Attendee.joins(:user).where(event_id: params[:id]).select("users.first_name as first_name, users.last_name as last_name, users.email as email")
  end

  # process the event creation
  def create
    Event.create(event_params)
    redirect_to "/events/#{current_user.id}/new2"
  end

  # edit page for event
  def edit
    @event = Event.find(params[:id])
  end

  # process the update for event
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to "/events/#{current_user.id}"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  # delete an event
  def delete
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to "/events/#{current_user.id}"
  end

  # grab events parameters
  private
    def event_params
      params.require(:event).permit(:name, :description, :when, :where, :user_id)
    end
end
