class LikesController < ApplicationController

	before_action :set_photo

  def destroy
    @like = @photo.likes.where(user: current_user)

    @like.destroy_all
    flash[:success] = "Like deleted!"
    redirect_to :back
  end

  def create
   	@like = @photo.likes.create(photo: @photo, user: current_user)
    
    if @like.save
      # respond_to do |format|
      #   format.html  { redirect_to :back }
      #   format.js {}
      # end
      flash[:success] = "Like created!"
      redirect_to :back           
    else
      flash[:alert] = "Something is wrong!"
      render 'users#show'
    end
  end

  private

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

end
