Rails.application.routes.draw do
  root to: "tweets#index"
  
  resources :tweets
  
  
    devise_for :users, controllers:  { registrations: 'users/registrations' }
  
    resources :users, only: %w[show]
    get '/users', to: 'tweets#index'

 get '/follow_user/:id', to: 'users#follow_user', as: :follow_user
 get '/unfollow_user/:id', to: 'users#unfollow_user', as: :unfollow_user
#  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
