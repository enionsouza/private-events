class EventsController < ApplicationController
  before_action :authenticate_user!, except:[:index]

  def index
    @events = Event.all.order(:date)
    @users = User.all
  end

  def show
    @event = Event.find(params[:id])
  end
end
