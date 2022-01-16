class BooksController < ApplicationController


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
     @new_book = Book.find(params[:id])
    　if @new_book.update(user_params)
    　redirect_to book_path(@new_book.id),notice:'You have updeted user successfully.'
    　else
      flash.now[:alert]='update error'
      render :edit_book
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
end
