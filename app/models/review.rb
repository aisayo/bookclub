class Review < ApplicationRecord
  before_action :logged_in?, only: [:new, :edit, :delete]

  belongs_to :book
  belongs_to :user

  validates :title, :content, presence: true
  validates :content, length: { maximum: 300 }
  
end
