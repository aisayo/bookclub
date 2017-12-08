class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :rating, :user_id, :book_id
end
