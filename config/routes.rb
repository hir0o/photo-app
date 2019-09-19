Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :users, only: [:show]
  resources :posts, only: [:new, :show, :create, :destroy]
  # devise_for :users, :controllers => {
  #   :registrations => 'users/registrations',
  #   :sessions => 'users/sessions'   
  # }
  # devise_scope :user do
  #   get "sign_in", :to => "users/sessions#new"
  #   get "sign_out", :to => "users/sessions#destroy" 
  # end
end
