# frozen_string_literal: true

Rails.application.routes.draw do
  resources :orders
  resources :clients
  resources :foods
  resources :managers
  resources :admins
  resources :branches
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'sign_up', to: 'registrations#create'
        post 'sign_in', to: 'sessions#create'
      end
    end
  end
end
