class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @book.reviews.build(title: params[:title], content: params[:content])
  end

  def create
    @book = Book.create(book_params)
    if @book.save
    redirect_to books_path(@book)
    else
    render :new
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
    book_review = @book.reviews
  end

private

  def book_params
    params.require(:book).permit(:title, :author, reviews_attributes: [:title, :content])
  end

end
