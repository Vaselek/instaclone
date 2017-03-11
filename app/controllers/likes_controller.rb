class LikesController < ApplicationController

	before_action :set_photo

  def new
  end

  def destroy
    @like = @photo.likes.where(user: current_user)

    @like.destroy_all
    flash[:success] = "like deleted!"
    redirect_to :back
  end

  def create
   	@like = @photo.likes.create(photo: @photo, user: current_user)
    
    if @like.save
      flash[:success] = "You have created a like!"
      redirect_to :back
    else
      flash[:alert] = "Something is wrong!"
      render 'users#show'
    end
  end

  

  def edit
  end

  private

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

end
