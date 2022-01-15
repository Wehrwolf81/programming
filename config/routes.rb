Rails.application.routes.draw do

  devise_for :users
  root to:'homes#top' 
  get"homes/about"=>'homes#show'
  resources :users, only: [:new, :create, :index, :show, :edit, :destroy]
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy]
  # post 'books' => 'books#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # resources :profile_images 
end

