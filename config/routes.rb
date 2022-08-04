Rails.application.routes.draw do
  root to: "pages#home"
  get "/contact-us", to: "pages#contact"
  devise_for :users
  resources :costumes, only: %i[index show]
end
