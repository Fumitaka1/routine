Rails.application.routes.draw do
  root 'static_pages#home'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    
  }
  
  get '/user/:id', to: 'users/show#show', as: :user
  
  resources :posts
end