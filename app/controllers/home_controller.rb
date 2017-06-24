class HomeController < ApplicationController

  def index
    @recipes = Recipe.all
    @cuisines = Cuisine.all
  end
end
