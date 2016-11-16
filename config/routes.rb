Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/failure'

  get 'photos/index'
  get '/auth/:fiveHundredPx/callback', to: 'sessions#create'
  root 'photos#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
