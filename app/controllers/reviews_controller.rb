class ReviewsController < ApplicationController
  before_action :set_restaurant
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
     if @review.save
      redirect_to restaurant_path(@restaurant), notice: "Done, you magnificant bastard!"
     else
      render :new
     end
  end

  def index
    @reviews = Reviews.all
  end

  def show

  end
  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
  def review_params
      params.require(:review).permit(:content, :rating)
  end
end
