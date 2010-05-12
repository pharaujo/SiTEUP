class EntitiesController < ApplicationController
  # GET /entities
  def index
    @entities = Entity.all
  end

  # GET /entities/1
  def show
    @entity = Entity.find(params[:id])
  end

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  # GET /entities/1/edit
  def edit
    @entity = Entity.find(params[:id])
  end

  # POST /entities
  def create
    @entity = Entity.new(params[:entity])

    if @entity.save
      flash[:notice] = 'Entity was successfully created.'
      redirect_to(@entity)
    else
      render :action => "new"
    end
  end

  # PUT /entities/1
  def update
    @entity = Entity.find(params[:id])

    if @entity.update_attributes(params[:entity])
      flash[:notice] = 'Entity was successfully updated.'
      redirect_to(@entity)
    else
      render :action => "edit"
    end
  end

  # DELETE /entities/1
  def destroy
    @entity = Entity.find(params[:id])
    @entity.destroy

    redirect_to(entities_url)
  end
end
