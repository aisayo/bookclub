class User < ApplicationRecord
  has_many :books
  has_many :ratings
  has_many :categories, through: :books
end
