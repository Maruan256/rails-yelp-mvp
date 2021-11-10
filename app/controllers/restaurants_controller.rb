class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :chef]
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
     if @restaurant.save
      redirect_to @restaurant, notice: "Done, you magnificant bastard!"
     else
      render :new
     end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @restaurants = Restaurant.all
  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
