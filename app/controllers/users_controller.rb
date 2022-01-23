class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books=@user.books
    @new_book=Book.new
  end

  def index
    @user = current_user
    @users = User.all
    @new_book= Book.new
    # @other_user = User.find(params[:id])

  end


  def edit
    @user = User.find(params[:id])
  if @user == current_user
    render :edit
  else
    redirect_to user_path(current_user)
  end
  end



  def create
    @new_book=Book.new(book_params)
    if @new_book.save
    redirect_to book_path(book.id),notice:'You have created book successfully.'
    else
      flash.now[:alert]='message error'
      @books=Book.all
      render :index
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id),notice:'You have updeted user successfully.'
    else
      # flash.now[:alert]='update error'
      render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
