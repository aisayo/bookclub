class Book < ApplicationRecord

  validates :title, :author, presence: true, uniqueness: true
  
end
