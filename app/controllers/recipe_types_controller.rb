class RecipeTypesController < ApplicationController
  before_action :find_recipe_type, only: %i[show edit update]
  before_action :set_collections, only: %i[edit update]

  def show; end

  def new
    @recipe_type = RecipeType.new
  end

  def create
    @recipe_type = RecipeType.create(recipe_type_params)
    if @recipe_type.valid?
      redirect_to @recipe_type
    else
      flash[:error] = 'Você deve informar o nome do tipo de receita'
      render :new
    end
  end

  def edit; end

  def update
    @recipe_type.update(recipe_type_params)
    if @recipe_type.valid?
      redirect_to @recipe_type
    else
      set_collections
      flash[:error] = 'Você deve informar todos os dados do novo tipo de
      receita'
      render :edit
    end
  end

  private

  def recipe_type_params
    params.require(:recipe_type).permit(:name)
  end

  def find_recipe_type
    @recipe_type = RecipeType.find params[:id]
  end

  def set_collections
    @recipe_types = RecipeType.all
  end
end
