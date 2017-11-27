class Book < ApplicationRecord

  has_many :reviews
  has_many :users, through: :reviews

  def reviews_attributes=(reviews_attributes)
    reviews_attributes.values.each do |reviews_attributes|
      self.reviews.build(reviews_attributes)
    end
  end

  validates :title, :author, presence: true
  validates :title, uniqueness: true

end
