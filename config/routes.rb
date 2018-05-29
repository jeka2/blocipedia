Rails.application.routes.draw do

  resources :search_suggestions, only: [:new, :create]

  resources :collaborations, only: [:create,:edit,:destroy]

  resources :downgrades, only: :create

  resources :charges, only: [:new,:create,:destroy]

  resources :wikis

  devise_for :users

  root 'wikis#index'

end
