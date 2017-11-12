class ReviewsController < ApplicationController
  include ReviewsHelper

  def index #do i even really need an index?
    @review = Review.all
  end

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
    #find the users review
      #could do a is_users_post? method
    #user can delete their own review only
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating, :user_id)
  end

end
