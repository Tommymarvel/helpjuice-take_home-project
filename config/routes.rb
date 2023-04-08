Rails.application.routes.draw do
  devise_for :users
  resources :users
  
  resources :articles do
  collection do
    get 'search'
  end
end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
end
