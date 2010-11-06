class MembersController < ApplicationController
  load_and_authorize_resource

  def index
    @hierarchies = Hierarchy.all
    @magister = Member.with_role("magister").first
    @ensaiador = Member.with_role("ensaiador").first
  end

  def show
  end

  def new
    @member = Member.new
    @member.build_entity
    @member.build_user
    @entity_type_id = EntityType.only_member.id
  end

  def edit
    @promotion = Promotion.new
    @promotion.time = Time.now # Default value

    @role = Role.new
    @role.start_date = Time.now # Default value

    @hierarchies = Hierarchy.all
    @entity_type_id = EntityType.only_member.id
  end

  def create
    if @member.save
      flash[:notice] = 'Member was successfully created.'
      redirect_to(@member)
    else
      @entity_type_id = EntityType.only_member.id
      render :action => "new"
    end
  end

  def update
    @member = Member.find(params[:id])

    if @member.update_attributes(params[:member])
      flash[:notice] = 'Member was successfully updated.'
      redirect_to(@member)
    else
      @entity_type_id = EntityType.only_member.id
      render :action => "edit"
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    redirect_to(members_url)
  end
end
