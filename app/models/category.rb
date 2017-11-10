class Category < ApplicationRecord
  validates :name, presense: true, uniqueness: true
end
