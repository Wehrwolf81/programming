Rails.application.routes.draw do

  root to:'homes#top'
  get"homes/about"=>'homes#about'
  devise_for :users
  resources :users
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :profile_images
end

