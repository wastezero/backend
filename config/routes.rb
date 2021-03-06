# frozen_string_literal: true

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :messages
  resources :chats
  resources :orders
  # resources :clients
  resources :foods
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'login', to: 'users#login'
      post 'sign_up', to: 'users#sign_up'
      get 'who_am_i', to: 'users#who_am_i'
      namespace :registration do
        resources :branches
        resources :restaurants
      end
      namespace :admin_panel do
        resources :managers do
          post 'approve', on: :member
        end
        resources :admins
        resources :branches
        resources :restaurants
        resources :orders
        resources :foods
      end
      # resources :clients
      namespace :client do
        resources :orders
        resources :branches
        resources :profile
        resources :my_orders
      end
    end
  end
end