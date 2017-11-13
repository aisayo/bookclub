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
    @review = current_user.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      flash[:success] = "Thanks for the review!"
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
    @review = Review.find_by(id: params[:id])
    #user can comment their own review
  end

  def update
    @book = Book.find(params[:id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:success] = "Review Updated!"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Unsuccessful update!"
      render :edit
    end
  end

  def destroy
    current_user.reviews.find(params[:id]).destroy
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
