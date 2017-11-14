module ReviewsHelper

  def find_book
    @book = Book.find(params[:id])
  end

  #trying to edit the review for a specific book.

end
