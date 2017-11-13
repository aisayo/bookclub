class ReviewsController < ApplicationController
  before_action :correct_user, only: :destroy
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
    @review = Review.find_by(id: params[:id])
    #user can comment their own review
  end

  def update
    @review = Review.update(review_params)
    if @review
      flash[:success] = "Review Updated"
      redirect_to root_path
    else
      render :edit
    end

    #updates reviews if edited
  end

  def destroy
    @review.destroy
    flash[:success] = "Review deleted"
    redirect_to root_path
    #find the users review
      #could do a is_users_post? method
    #user can delete their own review only
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating, :user_id, :book_id)
  end

  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    redirect_to root_path if @review.nil?
  end

end
