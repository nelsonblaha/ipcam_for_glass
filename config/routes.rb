IpcamForGlass::Application.routes.draw do
  resources :zones

  root :to => 'cameras#index'
  
  # session
  get 'signin', to: 'sessions#new', as: :signin
  get 'signout', to: 'sessions#destroy', as: :signout
  get '/auth/:provider/callback', to: 'sessions#create'
  
  resources :cameras
end