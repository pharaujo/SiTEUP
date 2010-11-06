class AvailabilitiesController < ApplicationController
  load_and_authorize_resource

  def new
  end
  
  def create
    if @availability.save
      flash[:notice] = "Successfully created availability."
      redirect_to @availability
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @availability.update_attributes(params[:availability])
      flash[:notice] = "Successfully updated availability."
      redirect_to @availability
    else
      render :action => 'edit'
    end
  end
  
  def show
  end
end
