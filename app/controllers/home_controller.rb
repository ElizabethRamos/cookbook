class HomeController < ApplicationController

  def index
    @recipes = Recipe.all
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end

  def search
    @search = params[:search_text]
    @recipes = Recipe.where("title = ?", params[:search_text])
    render :search_results
  end
end
