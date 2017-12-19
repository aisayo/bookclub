class Book < ApplicationRecord

  has_many :reviews
  has_many :users, through: :reviews

  default_scope -> { order(id: :asc) }


  def reviews_attributes=(reviews_attributes)
    reviews_attributes.values.each do |reviews_attributes|
      self.reviews.build(reviews_attributes)
    end
  end

  validates :title, :author, presence: true
  validates :title, uniqueness: true

  def next
    books = book_ids_by_title
    book_index = books.find_index(id)
    next_book = book_index + 1
    if next_book < books.length
      books[next_book]
    else
      id
    end
  end

  def prev
    books = book_ids_by_title
    book_index = books.find_index(id)
    prev_book = book_index - 1
    if prev_book > 0
      books[prev_book]
    else
      id
    end
  end

private

def book_ids_by_title
  @book_ids ||= Book.order(title: :asc).pluck(:id)
end

end
