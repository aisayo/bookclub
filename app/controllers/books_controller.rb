class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @book.reviews.build(params[:reviews_attributes])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path(@book)
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
    @review = @book.reviews.build
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @book.to_json}
    end
  end

private

  def book_params
    params.require(:book).permit(:title, :author, :summary, reviews_attributes: [:title, :content, :rating, :user_id])
  end

end
