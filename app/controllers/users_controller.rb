class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile_images = @user.profile_image(params[:id])
    @book=Book.all
    @new_book=Book.new
  end

  def index
    @book=Book.all
    # @user=User.all
    @user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
  end



  def create
    @new_book=Book.new(book_params)
    if @new_book.save
    redirect_to book_path(@new_book.id),notice:'Book was successfully created.'
    else
      flash.now[:alert]='message error'
      @books=Book.all
      render :user
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to books_path(@user.id),notice:'Book was successfully updated.'
    else
      flash.now[:alert]='update error'
      render :edit_user
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
