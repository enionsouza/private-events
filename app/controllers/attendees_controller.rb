class AttendeesController < ApplicationController
  def create
    Attendee.create({ user_id: current_user.id, event_id: params[:event_id].to_i })
    redirect_to event_path(params[:event_id])
  end

  def destroy
    Attendee.find_by(user_id: current_user.id, event_id: params[:event_id].to_i).delete
    redirect_to event_path(params[:event_id])
  end
end
