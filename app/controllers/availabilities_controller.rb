class AvailabilitiesController < ApplicationController
  def new
    @availability = Availability.new
  end
  
  def create
    @availability = Availability.new(params[:availability])
    if @availability.save
      flash[:notice] = "Successfully created availability."
      redirect_to @availability
    else
      render :action => 'new'
    end
  end
  
  def edit
    @availability = Availability.find(params[:id])
  end
  
  def update
    @availability = Availability.find(params[:id])
    if @availability.update_attributes(params[:availability])
      flash[:notice] = "Successfully updated availability."
      redirect_to @availability
    else
      render :action => 'edit'
    end
  end
  
  def show
    @availability = Availability.find(params[:id])
  end
end
