class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :rating, :user_id, :book_id
  # belongs_to :book #do i need this? taking this out helps Json not load the book information since we are just looking for review content

end
