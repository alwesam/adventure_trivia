class ReviewsController < ApplicationController
  def create
    review_params = params.require(:review).permit(:rating)
    review = Review.new review_params
    review.adventure = Adventure.find params[:adventure_id]
    if review.save
      render json: {succes: true}
    else
      render json: {succes: false}
    end
  end
end
