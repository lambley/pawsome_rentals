Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  resources :costumes, only: %i[index show]
  resources :users, only: %i[show]
end
