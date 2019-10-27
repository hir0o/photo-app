Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: %i[index show] do
    resources :likes, only: %i[index]
    member do
      get :following, :followers, :map
     end
  end
  resources :relationships, only: %i[create destroy]
  resources :posts, only: %i[index new show create update destroy search edit] do
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[create edit update destroy]
  end

  get'/map',to: 'posts#map'

end
