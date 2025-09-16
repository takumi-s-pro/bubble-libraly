Rails.application.routes.draw do
  get 'novels/index'
  get 'novels/show'
  get 'novels/new'
  get 'novels/create'
  get 'novels/edit'
  get 'novels/update'
  get 'novels/destroy'
  root 'novels#index'
  devise_for :users
  resources :novels
end