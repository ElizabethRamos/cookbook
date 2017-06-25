class CuisinesController <ApplicationController

  def show
    @cuisine = Cuisine.find(params[:id])
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(params.require(:cuisine).permit(:name))
    if @cuisine.save
      redirect_to @cuisine
    else
      flash[:error] = 'Você deve informar o nome da cozinha'
      render :new
   end
  end
end
