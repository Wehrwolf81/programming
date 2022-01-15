class BooksController < ApplicationController
  
   
   def new
    @book = Book.new
   end
  
   
   def index
    @user = User.find(params[:id])
    binding.pry
    @book=Book.all
    # @book = Book.find(params[:id])
    # @profile_images=ProfileImage.page(params[:page]).reverse_order
   end  
   
    def new
     @book=Book.new
    end

    def show
    @user = User.find(params[:id])
    # @profile_images = @user.profile_images.page(params[:page]).reverse_order
    @book=Book.all
    @new_book=Book.new
    # @profile_image=PostImage.find(params[:id])
    
    
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
    
    def edit
    @book = Book.find(params[:id])
    end  

   def destroy
    @post_image=PostImage.find(params[:id])
    @post_image.destroy
    redirect_to show_images_path, notice:'Book was successfully destroyed'
    
   end
   
   private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
