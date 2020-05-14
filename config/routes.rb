Rails.application.routes.draw do
  
  root 'users#login'
  
  get '/login', to: 'users#login'
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users
  
end
