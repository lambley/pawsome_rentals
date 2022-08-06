Rails.application.routes.draw do
  root to: "pages#home"
  get "/contact-us", to: "pages#contact"
  get '/about', to: "pages#about"
  devise_for :users
<<<<<<< HEAD
  resources :costumes, only: %i[index show new create]
=======
  resources :costumes, only: %i[index show edit update]
>>>>>>> 16331e9017d822176b901a561c3212d34a5b0f84
  resources :users, only: %i[show]
end
