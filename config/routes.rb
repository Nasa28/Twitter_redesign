Rails.application.routes.draw do
  root to: "tweets#index"
  
  resources :tweets
  
  
    devise_for :users, controllers:  { registrations: 'users/registrations' }
  
 resources :users, only: [:show]

 resources :users do
  member do
  get :following, :followers
  end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
