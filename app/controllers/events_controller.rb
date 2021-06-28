class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def index
    @events = Event.all.order(:date)
    @users = User.all
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(@event.creator_id)
    @attendees = @event.attendees
    @attending = @event.attendees.where(id: current_user.id).any?
    @owner = @event.creator == current_user
  end

  def edit
    @event = Event.find(params[:id]) if Event.find(params[:id]).creator == current_user
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    Event.find(params[:id]).delete
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :location)
  end
end
