class ReviewsController < ApplicationController
  before_action :current_user, only: [:edit, :destroy]

  def recent_reviews
    @recent_reviews = Review.recent_reviews
  end

  def popular_books
    @popular_books = Review.highest_rated_books
  end

  def index
    @book = Book.find(params[:book_id])
    @reviews = @book.reviews
    render json: @reviews #this renders books/1/revies.json, without this doesnt work
  end

  def new
    @review = Review.new
  end
 
  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.build(review_params)
    @review.user = current_user
      if @review.save
         respond_to do |f|
           f.html {redirect_to book_path(@book)}
           f.json {render :json => @review}
         end
       flash[:success] = "Thanks for the review!"
      else
       render :new
      end
  end

  def show
    @review = Review.find(params[:id])
    @book = @review.book
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @review}
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @review = Review.find(params[:id])
    @book = @review.book
  end

  def update
    @review = Review.find(params[:id])
    @book = @review.book
    if @review.update(review_params)
      flash[:success] = "Review Updated!"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy
    flash[:success] = "Review deleted"
    redirect_to user_path(current_user)
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating, :user_id, :book_id)
  end

end
