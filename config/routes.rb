Rails.application.routes.draw do
  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
  root to: 'home#index'
  get 'search', to: 'home#search'
  post 'search', to: 'home#search'
  get 'search_results', to: 'home#search_results'
  get 'all_recipes', to:'home#all_recipes'
  get 'recipes', to: 'recipes#new'
  resources :recipes, only: [:new, :create, :show, :edit, :update] do
    collection do
      get 'my_recipes'
    end
  end
  resources :cuisines, only: [:new, :create, :show, :edit, :update]
  resources :recipe_types, only: [:new, :create, :show, :edit, :update]
end
