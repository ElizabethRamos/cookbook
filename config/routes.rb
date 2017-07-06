Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'search', to: 'home#search'
  post 'search', to: 'home#search'
  get 'search_results', to: 'home#search_results'
  get 'all_recipes', to:'home#all_recipes'
  get 'recipes', to: 'recipes#new'
  get 'my_recipes', to: 'recipes#my_recipes'
  resources :recipes, only: [:new, :create, :show, :edit, :update]
  resources :cuisines, only: [:new, :create, :show, :edit, :update]
  resources :recipe_types, only: [:new, :create, :show, :edit, :update]
end
