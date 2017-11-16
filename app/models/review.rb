class Review < ApplicationRecord

  belongs_to :user
  belongs_to :book

  default_scope -> { order(created_at: :desc) }

  scope :recent_reviews, -> { order(created_at: :desc) }

  def self.highest_rated_books
    @highest_reviews = self.all.select do |review|
      review.rating == 5
    end
    @highest_reviews.map do |review|
      review.book
    end.uniq
  end

  validates :title, :content, presence: true
  validates :content, length: { maximum: 250 }
  validates :rating, presence: true

end
