class HomeController < ApplicationController
before_action :set_collections, only: [:index, :all_recipes]

  def index
    @recipes = Recipe.last(6)

  end

  def search
    @search = params[:search_text]
    @recipes = Recipe.where("title = ?", params[:search_text])
    render :search_results
  end

  def all_recipes
    @recipes = Recipe.all
    render 'index'
  end

private

def set_collections
  @cuisines = Cuisine.all
  @recipe_types = RecipeType.all
end
end
