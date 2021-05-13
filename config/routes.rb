Rails.application.routes.draw do
  
  
  get 'tweets/index'
  get 'tweets/new'
  get 'tweets/create'
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: "tweets#index"
  resources :tweets, only: [:new, :create, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
