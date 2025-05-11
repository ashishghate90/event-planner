class EventJoinersController < ApplicationController
  def join
    event = Event.find(params[:event_id])
    event_joiners = event.event_joiners.find_or_initialize_by(user: current_user)
    rsvp.status = "attending"
    rsvp.save
    redirect_to event_path(event), notice: "You have event joined"
  end

  def leave
    rsvp = EventJoiner.find_by(event_id: params[:event_id], user: current_user)
    rsvp.destroy if rsvp
    redirect_to event_path(params[:event_id]), notice: "event join canceled."
  end
end
