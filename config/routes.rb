Rails.application.routes.draw do
  devise_for :users
  resources :users
  mount ActionCable.server => "/cable"
  get "/search_count", to: "search_count#index"
  resources :articles do
  collection do
    get 'search'
  end
end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
end
