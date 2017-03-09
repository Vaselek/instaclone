class PhotosController < ApplicationController
  def new
  	@photo = Photo.new
  end

  def create
  	@photo = Photo.new(photo_params)
  	if @photo.save
  		redirect_to @photo
  	else 
  		render 'new'
  	end
  end

  def show
  	@photo = Photo.find(params[:id])
  end

  def index
  	@photos = Photo.all
  end

  def edit
  	@photo = Photo.find(params[:id])
  end

  def update
  	if @photo.update
  		redirect_to @photo
  	else 
  		render 'new'
  	end
  end

  private

  def photo_params
  	params.require(:photo).permit(:title, :image)
  end
  
end
