Rails.application.routes.draw do
  root to: "pages#home"
  get "/contact-us", to: "pages#contact"
  get '/about', to: "pages#about"
  devise_for :users
  resources :costumes, only: %i[index show edit update] do
    resources :bookings, only: %i[new create index show edit update destroy]
  end
  # costume index > costume show > costume booking new/create > user booking show/index
end
