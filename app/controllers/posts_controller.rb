class PostsController < ApplicationController
  load_and_authorize_resource

  def index
  end
  
  def show
  end
  
  def new
  end
  
  def create
    if current_user.nil?
      flash[:error] = "No human man art thou!"
      redirect_to @post
    else
      @post.member = current_user.member

      if @post.save
        flash[:notice] = "Successfully created post."
        redirect_to @post
      else
        render :action => 'new'
      end
    end
  end
  
  def edit
  end
  
  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to @post
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_url
  end
end
