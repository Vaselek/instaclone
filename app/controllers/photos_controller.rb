class PhotosController < ApplicationController
  def new
  	@photo = Photo.new
  end

  def create
    @user = current_user
  	@photo = @user.photos.create(photo_params)
  	if @photo.save
      # save_image
  		redirect_to @photo      
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
      save_image
  		redirect_to @photo
  	else 
  		render 'new'
  	end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
  end

  private

  def photo_params
  	params.require(:photo).permit(:title, :image)
  end

  def save_image
    uploaded_file = params[:photo][:image]

    unless uploaded_file.nil?
      new_file_path = Rails.root.join('public', 'uploads', @photo.id.to_s)

      File.open(new_file_path, 'wb') do |file|
        file.write uploaded_file.read
      end
    end
  end
  
end
