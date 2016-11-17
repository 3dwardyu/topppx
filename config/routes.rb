Rails.application.routes.draw do

  get 'photos/index'
  get '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'vote', to: 'photos#vote', as: 'vote', via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  root 'photos#index'


  match '/auth/failure', :to => 'sessions#failure', via: [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
