Rails.application.routes.draw do
  root to: "tweets#index"
  
  resources :tweets
  
  
    devise_for :users, controllers:  { registrations: 'users/registrations' }
  
 get '/show/:id', to: 'users#show', as: :user_show

#  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
