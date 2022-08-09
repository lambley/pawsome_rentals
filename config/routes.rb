Rails.application.routes.draw do
  root to: "pages#home"
  get "/contact-us", to: "pages#contact"
  get '/about', to: "pages#about"
  devise_for :users
  resources :users, only: %i[show]
  resources :costumes, only: %i[index show edit update new create] do
    resources :bookings, only: %i[new create]
  end
  resources :users, only: %i[show]d
end
