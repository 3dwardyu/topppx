Rails.application.routes.draw do
  get 'photos/index'
  get '/auth/:provider/callback', to: 'sessions#create'
  root 'photos#index'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/failure'

  get '/login', :to => 'sessions#new', :as => :login
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
