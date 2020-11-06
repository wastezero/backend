# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders
  # resources :clients
  resources :foods
  resources :admins
  resources :branches
  resources :restaurants
  post 'login', to: 'users#login'
  post 'sign_up', to: 'users#sign_up'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :managers
      end
    end
  end
end
