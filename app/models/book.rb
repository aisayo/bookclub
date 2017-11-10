class Book < ApplicationRecord
  validates :title, :author, presence: true #needs uniqueness
end
