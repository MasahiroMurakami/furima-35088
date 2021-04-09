Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'items/index'
  resources :prototypes, only: [:index]
end
