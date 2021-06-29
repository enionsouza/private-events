class AttendancesController < ApplicationController
  def destroy
    Attendance.find(params[:id]).delete
    redirect_to event_path(Event.find(params[:event_id]))
  end
end
