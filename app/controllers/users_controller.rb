class UsersController < ApplicationController
  def show
  	
  end

  def index
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end
end
