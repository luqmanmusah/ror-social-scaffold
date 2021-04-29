Rails.application.routes.draw do
  root "posts#index"

  devise_for :users

  resources :users, only: [:index, :show]
  get "friendships/update"
  get "friendships/create"
  get "friendships/destroy"
  post "friendships/create"
  post "friendships/update"
  post "friendships/destroy"

  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
