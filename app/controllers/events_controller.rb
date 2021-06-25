class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.create_event(event_params)
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
    @user = User.find(@event.creator.user_id)
  end

  def edit
    @event = Event.find(params[:id]) if Event.find(params[:id]).creator.user == current_user
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params) && (current_user.creators.include? event.creator)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.attendees.delete_all
    creator = event.creator
    event.delete # if current_user.creators.include? event.creator
    creator.delete
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :location)
  end
end
