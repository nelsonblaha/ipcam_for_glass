IpcamForGlass::Application.routes.draw do
  root :to => 'cameras#index'
  get 'signin', to: 'sessions#new', as: :signin
  get 'signout', to: 'sessions#destroy', as: :signout
  resources :cameras
end