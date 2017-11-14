module ReviewsHelper

  def find_book
    @book = Book.find(params[:book_id])
  end




end
