Rails.application.routes.draw do
  
  
  
  get 'new_tweet', to: 'tweets#new'
  post 'new_tweet', to: 'tweets#create'
  resources :tweets
  devise_for :users, controllers:  { registrations: 'users/registrations' }
  root to: "tweets#index"
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
