class CuisinesController < ApplicationController
  before_action :find_cuisine, only: %i[show edit update]
  before_action :set_collections, only: %i[new edit update]

  def show; end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.create(cuisine_params)
    if @cuisine.valid?
      redirect_to @cuisine
    else
      set_collections
      flash[:error] = 'Houve um erro'
      render :new
    end
  end

  def edit; end

  def update
    @cuisine.update(cuisine_params)
    if @cuisine.valid?
      redirect_to @cuisine
    else
      set_collections
      flash[:error] = 'Houve um erro'
      render :edit
    end
  end

  private

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end

  def find_cuisine
    @cuisine = Cuisine.find params[:id]
  end

  def set_collections
    @cuisines = Cuisine.all
  end
end
