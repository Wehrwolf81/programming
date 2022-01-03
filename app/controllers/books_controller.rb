class BooksController < ApplicationController
  
   def index
    @profile_images=ProfileImage.page(params[:page]).reverse_order
   end  

    def show
    @profile_image=PostImage.find(params[:id])
    
    end

   def destroy
    @post_image=PostImage.find(params[:id])
    @post_image.destroy
    redirect_to show_images_path
   end
end
