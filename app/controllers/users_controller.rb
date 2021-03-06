class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
  	@photos = @user.photos
    @photo = current_user.photos.new
  end

  def index
    @users = User.all
    @following = current_user.following
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end
end
