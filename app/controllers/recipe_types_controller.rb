class RecipeTypesController < ApplicationController

  def show
    @recipe_type = RecipeType.find params[:id]
  end

end
