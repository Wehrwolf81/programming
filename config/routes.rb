Rails.application.routes.draw do

  devise_for :users
  root to:'homes#top'
  get"homes/about"=>'homes#show'
  resources :users
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :profile_images
end

