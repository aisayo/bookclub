class Review < ApplicationRecord

  belongs_to :user
  belongs_to :book

  accepts_nested_attributes_for :book

  default_scope -> { order(created_at: :desc) }

  validates :title, :content, presence: true
  validates :content, length: { maximum: 250 }

end
