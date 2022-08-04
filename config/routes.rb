Rails.application.routes.draw do
  root to: "pages#home"
  get '/about', to: "pages#about"
  devise_for :users
  resources :costumes, only: %i[index show edit update]
  resources :users, only: %i[show]
end
