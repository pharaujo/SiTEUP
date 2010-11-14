class EventTypesController < ApplicationController
  load_and_authorize_resource

  def index
    @event_types = EventType.find(:all, :conditions => ['description ILIKE ?', "%#{params[:term]}%"])

    respond_to do |format|
      format.json {render :json => @event_types.map {|e| e.description} }
    end
  end
end
