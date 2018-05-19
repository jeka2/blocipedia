Rails.application.routes.draw do

  get 'downgrade/create'

  resources :charges, only: [:new,:create,:destroy]

  resources :wikis

  devise_for :users

  root 'wikis#index'

end
