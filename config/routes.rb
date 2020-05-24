Rails.application.routes.draw do
  
  get 'static_pages/privacy'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  root 'sessions#new'
  
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  
end
