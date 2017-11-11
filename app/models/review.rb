class Review < ApplicationRecord

  belongs_to :user
  belongs_to :book
  
  default_scope -> { order(created_at: :desc) }

  validates :title, :content, presence: true
  validates :content, length: { maximum: 250 }
  validates :book_id, :user_id, presence: true

end
