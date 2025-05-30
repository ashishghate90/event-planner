class EventJoinersController < ApplicationController
  def join
    event = Event.find(params[:event_id])
    joiner = event.event_joiners.find_or_initialize_by(user: current_user)
    joiner.status = "attending"
    joiner.save
    redirect_to event_path(event), notice: "You have event joined"
  end

  def leave
    joiner = EventJoiner.find_by(event_id: params[:event_id], user: current_user)
    joiner.destroy if joiner
    redirect_to event_path(params[:event_id]), notice: "event join canceled."
  end
end
