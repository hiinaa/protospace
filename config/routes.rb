Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes do
    resources :likes, only: [:create, :destroy]
  end
  resources :comments, only: :create
  resources :users, only: [:show, :edit, :update]
end
