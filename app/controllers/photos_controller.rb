class PhotosController < ApplicationController
  
  def new
  	@photo = Photo.new
  end

  def create
    @user = current_user
  	@photo = @user.photos.create(photo_params)
  	if @photo.save
      flash[:success] = "Photo created!"
  		redirect_to :back      
  	else
  		redirect_to :back
  	end
  end

  def show
  	@photo = Photo.find(params[:id])
  end

  def index
  	@photos = Photo.all
  end

  def edit
  	@photo = Photo.find(params[:user_id])
  end

  def update
  	if @photo.update
      redirect_to @photo
  	else 
  		render 'new'
  	end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:success] = "Photo deleted!"

    redirect_to :back
  end

  private

  def photo_params
  	params.require(:photo).permit(:title, :image)
  end
  
end
