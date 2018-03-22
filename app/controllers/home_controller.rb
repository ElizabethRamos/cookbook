class HomeController < ApplicationController
  before_action :set_collections, only: %i[index all_recipes]

  def index
    @recipes = Recipe.last(6)
    difficulty
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

  def difficulty
    @easy_recipes = Recipe.where("difficulty = ?", "Fácil")
    @medium_recipes = Recipe.where("difficulty = ?", "Médio")
    @hard_recipes = Recipe.where("difficulty = ?", "Difícil")
  end

  private

  def set_collections
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end
end
