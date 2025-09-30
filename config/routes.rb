Rails.application.routes.draw do
  get 'users/show'
  root 'novels#index'
  devise_for :users
  resources :novels

  resources :users, only: [:show, :edit, :update]
end