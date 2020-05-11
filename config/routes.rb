Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    
  }
    
  get '/user/:id', to: 'users/show#show'
  root 'static_pages#home'
end
