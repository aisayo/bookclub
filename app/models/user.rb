class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :books
  has_many :reviews

  validates :username, presence: true, length: { maximum: 10}, uniqueness: true, format: { without: /[0-9]/, message: "does not allow numbers" }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 30},
  format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

end
