Rails.application.routes.draw do
  root to: 'home#index'
  resources :recipes, only: [:new, :create, :show]
  resources :cuisines, only: [:show]
end
