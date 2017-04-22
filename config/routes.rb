Rails.application.routes.draw do
  resources :location_ratings
  root to: 'visitors#index'

  post :login, to: 'visitors#login'
end
