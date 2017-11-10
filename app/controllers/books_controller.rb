class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
  end

  def create
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

end
