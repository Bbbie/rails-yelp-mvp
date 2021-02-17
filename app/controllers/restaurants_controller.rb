class RestaurantsController < ApplicationController

  #  A visitor can see the list of all restaurants
  def index
    @restaurants = Restaurant.all
  end

  # A visitor can add a new restaurant,
  def new
    @restaurant = Restaurant.new
  end
  # and be redirected to the show view of that new restaurant.
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: "Restaurant #{@restaurant.name} was successfully created!"
    else
      render :new
    end

  # A visitor can see the details of a restaurant, with all the reviews related to the restaurant.
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private
  def restaurant_params
    #only allow trusted parameters
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
