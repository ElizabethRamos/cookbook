class RecipesController < ApplicationController

  def new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    redirect_to @recipe

  end

  def show
    id = params[:id]
    @recipe = Recipe.find(id)
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type, :cuisine, :difficulty, :cook_time, :ingredients, :method)
  end
end
