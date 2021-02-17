class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    # new review with content & rating
    @review = Review.new(review_params)
    # add a restaurant (id) as well
    # @review.restaurant = @restaurant.id
    @review.restaurant = @restaurant
    # then save
    if @review.save
    # redirect to restaurant show page
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
