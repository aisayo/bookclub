class Review < ApplicationRecord

  belongs_to :user
  belongs_to :book

  validates :title, :content, presence: true
  validates :content, length: { maximum: 250 }
  validates :book_id, :user_id, presence: true

end
