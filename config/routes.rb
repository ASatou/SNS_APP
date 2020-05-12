Rails.application.routes.draw do
  
  root 'users#login'
  
  get 'users/login'
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
