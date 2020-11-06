# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders
  # resources :clients
  resources :foods
  post 'login', to: 'users#login'
  post 'sign_up', to: 'users#sign_up'
  get 'who_am_i', to: 'users#who_am_i'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :admin_panel do
        resources :managers
        resources :admins
        resources :branches
        resources :restaurants
      end
    end
  end
end
