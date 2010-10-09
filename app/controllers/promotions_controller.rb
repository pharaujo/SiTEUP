class PromotionsController < ApplicationController
  def create
    @promotion = Promotion.new(params[:promotion])
    if @promotion.save
      flash[:notice] = "Successfully created promotion."
      redirect_to edit_member_path(@promotion.member)
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @promotion = Promotion.find(params[:id])
    @promotion.destroy
    flash[:notice] = "Successfully destroyed promotion."
    redirect_to promotions_url
  end
end
