class Review < ApplicationRecord

  belongs_to :user
  belongs_to :book

  default_scope -> { order(created_at: :desc) }

  scope :recent_reviews, -> { order(created_at: :desc) }

  def self.highest_rated_books
    @highest_reviews = self.all.select do |r|
      r.rating == 5
    end
    @highest_reviews.map do |review|
      review.book
    end.uniq
  end

  def self.highest_level
      @most_severe_vibes = self.all.select do |sv|
        sv.level == 5
      end
      @most_severe_vibes.map do |vibe|
        vibe.name
      end.uniq
    end


  validates :title, :content, presence: true
  validates :content, length: { maximum: 250 }
  validates :rating, presence: true

end
