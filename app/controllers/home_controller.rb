class HomeController < ApplicationController

  def index
    @recipes = Recipe.all
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
  end
end
