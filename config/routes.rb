Rails.application.routes.draw do
  resources :articles, only: [:index] do
    collection { post :search, to: 'queries#search' }
  end

  resources :users, only: [:create]

  delete '/logout', to: 'users#delete_session'

  get '/charts', to: 'charts#render_charts'

  root 'articles#index'
end
