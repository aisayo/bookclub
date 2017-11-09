class User < ApplicationRecord
  has_many :books
  has_many :ratings, through: :books
  has_many :categories, through: :books
end
