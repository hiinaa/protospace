Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes
    resources :likes, only: [:create, :destroy]
  resources :users, only: [:show, :edit, :update]
end
