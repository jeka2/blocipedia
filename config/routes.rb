Rails.application.routes.draw do

  resources :downgrades, only: :create

  resources :charges, only: [:new,:create,:destroy]

  resources :wikis

  devise_for :users

  root 'wikis#index'

end
