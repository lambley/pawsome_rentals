Rails.application.routes.draw do
  devise_for :users
  root to: "costumes#index"
  # get 'costumes', to: 'costumes#index', as: :list_costumes

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
