class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile_images = @user.profile_images.page(params[:page]).reverse_order
  end
  
  def index
  end 
  
  def create
  end
end
