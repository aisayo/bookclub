class ReviewsController < ApplicationController
  include ReviewsHelper

  def new
    @review = Review.new
  end

  def create
    new_review
  end

  def edit
    #user can comment their own review
  end

  def update
    #updates reviews if edited
  end

  def delete
    #user can delete their own review
  end

  private

  def review_params
    params.require(:review).permit(:title, :content)
  end

end
