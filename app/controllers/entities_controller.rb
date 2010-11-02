class EntitiesController < ApplicationController
  load_and_authorize_resource

  # GET /entities
  def index
    authorize! :manage, Entity
    @entity_types = EntityType.except_members 
  end

  # GET /entities/1
  def show
    authorize! :manage, Entity
  end

  # GET /entities/new
  def new
    @entity_types = EntityType.except_members 
  end

  # GET /entities/1/edit
  def edit
    @entity_types = EntityType.except_members 
  end

  # POST /entities
  def create

    if @entity.save
      flash[:notice] = 'Entity was successfully created.'
      redirect_to(@entity)
    else
      @entity_types = EntityType.except_members 
      render :action => "new"
    end
  end

  # PUT /entities/1
  def update

    if @entity.update_attributes(params[:entity])
      flash[:notice] = 'Entity was successfully updated.'
      redirect_to(@entity)
    else
      @entity_types = EntityType.except_members 
      render :action => "edit"
    end
  end

  # DELETE /entities/1
  def destroy
    @entity.destroy

    redirect_to(entities_url)
  end
end
