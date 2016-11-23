Rails.application.routes.draw do
  root 'photos#index'
  get 'photos/index'
  get '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'vote', to: 'photos#vote', as: 'vote', via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]
end
