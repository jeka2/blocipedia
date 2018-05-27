Rails.application.routes.draw do

  resources :search_suggestions, only: :index

  resources :collaborations, only: [:new,:create,:delete]

  resources :downgrades, only: :create

  resources :charges, only: [:new,:create,:destroy]

  resources :wikis

  devise_for :users

  root 'wikis#index'

end
