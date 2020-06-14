# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'

  }

  get '/user/:id', to: 'users/show#show', as: :users
  get '/user/:id/followers', to: 'users/show#followers', as: :followers_users
  get '/user/:id/following', to: 'users/show#following', as: :following_users

  resources :posts
  resources :comments
  resources :relationships, only: %i[create destroy]
  resources :bookmarks, only: %i[create destroy index]
end
