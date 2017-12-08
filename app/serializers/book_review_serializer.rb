class BookReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :rating, :user_id, :book_id
end
