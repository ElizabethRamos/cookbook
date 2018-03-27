class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_collections, only: %i[new edit update show]
  before_action :find_recipe, only: %i[edit show update]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.valid?
      @recipe.save
      redirect_to @recipe
    else
      set_collections
      flash[:error] = 'Houve um erro'
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @recipe.update(recipe_params)
    if @recipe.valid?
      redirect_to @recipe
    else
      set_collections
      flash[:error] = 'Houve um erro'
      render :edit
    end
  end

  def my_recipes
    @recipes = Recipe.where(user: current_user.id)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :recipe_type_id, :cuisine_id,
                                   :difficulty, :cook_time, :ingredients,
                                   :method, :photo)
  end

  def set_collections
    @cuisines = Cuisine.all
    @recipe_types = RecipeType.all
    @recipes = Recipe.all
  end

  def find_recipe
    @recipe = Recipe.find params[:id]
  end
end
