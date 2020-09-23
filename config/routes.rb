Rails.application.routes.draw do
  devise_for :users
  root  'events#index'
  get '/events/search' => 'events#search'
  resources :events
  resources :users
end
