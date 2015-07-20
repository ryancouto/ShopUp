class Api::ReviewsController < ApplicationController

  def new
    @review = current_user.reviews.new
  end

  def create
    @review = current_user.reviews.new
    if @review.save
      render json: @review
    else
      render json: @review.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = current_user.reviews.find(params[:id])
  end

  def update
    @review = current_user.reviews.find(params[:id])
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy
  end


  private
  def review_params
    params.require(:review).permit(:shop_id, :user_id, :title, :body)
  end

end
