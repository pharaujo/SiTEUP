class EventsController < ApplicationController
  load_and_authorize_resource

  def index
    @grouped_events = @events.group_by {|e| [e.start_date.mon, e.start_date.year] }.sort
  end
  
  def show
    @members = Member.active.ordered
  end
  
  def new
  end
  
  def create
    if @event.save
      flash[:notice] = "Successfully created event."
      redirect_to @event
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated event."
      redirect_to @event
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event.destroy
    flash[:notice] = "Successfully destroyed event."
    redirect_to events_url
  end
end
