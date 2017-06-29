Rails.application.routes.draw do
  root to: 'home#index'
  get 'search', to: 'home#search'
  post 'search', to: 'home#search'
  get 'search_results', to: 'home#search_results'
  resources :recipes, only: [:new, :create, :show, :edit, :update]
  resources :cuisines, only: [:new, :create, :show]
  resources :recipe_types, only: [:new, :create, :show]
end
