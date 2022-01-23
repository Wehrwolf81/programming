class BooksController < ApplicationController
 before_action :correct_user, only: [:edit, :destroy]


   def new
    @book = Book.new
   end


   def index
    @user = User.find(current_user[:id])
    @books = Book.all
    @new_book=Book.new
   end

    def new
     @book=Book.new
    end

    def show
    @book=Book.find(params[:id])
    @user = @book.user
    # @profile_images = @user.profile_images.page(params[:page]).reverse_order
    @new_book=Book.new
    # @profile_image=PostImage.find(params[:id])


    end

    def create
     @user = current_user
     @new_book=Book.new(book_params)
     @new_book.user_id = current_user.id
     if @new_book.save
     redirect_to book_path(@new_book.id),notice:'Book was successfully created.'
     else
      # flash.now[:alert]='message error'

      @books=Book.all
      render :index
     end
    end

     def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
      redirect_to book_path(@book.id),notice:'You have updeted user successfully.'
      else
      flash.now[:alert]='update error'
       render :edit
      end
     end

    def edit
    @book = Book.find(params[:id])
    end

   def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice:'Book was successfully destroyed'

   end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end


  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to books_path unless @user == current_user
  end
end
