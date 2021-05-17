Rails.application.routes.draw do
  get 'users/show'
  root to: "tweets#index"
  
  resources :tweets
  

 
  devise_for :users, controllers:  { registrations: 'users/registrations' }
  resources :users, only: [:show]
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
