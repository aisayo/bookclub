class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :summary
  has_many :reviews, serializer: BookReviewSerializer
end
