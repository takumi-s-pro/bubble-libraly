Rails.application.routes.draw do
  root 'novels#index'
  devise_for :users
  resources :novels
end