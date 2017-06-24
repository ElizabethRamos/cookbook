class CuisinesController <ApplicationController

  def show
    id = params[:id]
    @cuisine = Cuisine.find(id)
  end
end
