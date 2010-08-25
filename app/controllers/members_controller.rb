class MembersController < ApplicationController
  # GET /members
  # GET /members.xml
  def index
    @members = Member.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @members }
    end
  end

  # GET /members/1
  # GET /members/1.xml
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/new/
  def new
    @member = Member.new
    @member.build_entity

    @entity_type_id = EntityType.only_member.id
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
    @entity_type_id = EntityType.only_member.id
  end

  # POST /members
  # POST /members.xml
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

  # PUT /members/1
  # PUT /members/1.xml
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

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    redirect_to(members_url)
  end
end
