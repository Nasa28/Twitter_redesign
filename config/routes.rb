Rails.application.routes.draw do
  
  
  resources :tweets, only: [:new, :create, :index]
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: "tweets#index"
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
