class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
    @member.build_entity
    @member.build_user
    @entity_type_id = EntityType.only_member.id
  end

  def edit
    @member = Member.find(params[:id])
    @entity_type_id = EntityType.only_member.id
  end

  def create
    @member = Member.new(params[:member])

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
