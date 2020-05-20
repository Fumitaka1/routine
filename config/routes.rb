Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',

  }

  get '/user/:id', to: 'users/show#show', as: :user
  get '/user/:id/followers', to: 'users/show#followers', as: :followers_user
  get '/user/:id/following', to: 'users/show#following', as: :following_user

  resources :posts
  resources :comments
  resources :relationships,       only: [:create, :destroy]
  resources :bookmarks,       only: [:create, :destroy, :index]
end
