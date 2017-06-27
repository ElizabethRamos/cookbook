Rails.application.routes.draw do
  root to: 'home#index'
  resources :recipes, only: [:new, :create, :show, :edit, :update]
  resources :cuisines, only: [:new, :create, :show]
  resources :recipe_types, only: [:new, :create, :show]
end
