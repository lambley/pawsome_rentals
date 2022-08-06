Rails.application.routes.draw do
  root to: "pages#home"
  get "/contact-us", to: "pages#contact"
  get '/about', to: "pages#about"
  devise_for :users
  resources :costumes, only: %i[index show edit update]
  resources :users, only: %i[show]
end
