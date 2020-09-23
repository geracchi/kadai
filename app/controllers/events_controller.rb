class EventsController < ApplicationController
  
  before_action :move_to_index, except: :index

  def index
    @events = Event.all
    
  end

  def create
    event = Event.new(event_params)
    event.save!
    @events = Event.where(user_id: current_user.id)
    
  end

  def show
    @events = Event.all
    @event = @events.where(id: params[:id])
    
  end

  def search
    @events = Event.search(params[:search])
    
  end
  
  
  def update
    event = Event.find(params[:id])
    @events = Event.where(user_id: current_user.id)
    event.update(event_params)
    redirect_to root_path
    
  end

  def destroy
     event = Event.find(params[:id])
     event.destroy
     redirect_to root_path
  end

  private
  def event_params
      params.require(:event).permit(:title, :start, :end, :user_id, :body)
  end
  
  def move_to_index
      redirect_to action: :index unless user_signed_in?
  end
end