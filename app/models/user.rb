class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :books
  has_many :ratings
  has_many :categories, through: :books

  validates :username, presence: true, length: { maximum: 10}, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 30},
  format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

  def self.find_or_create_by_omniauth(auth)
    oauth_email = auth["info"]["email"] || auth["info"]["nickname"] || auth["info"]["name"]
    self.where(:email => oauth_email).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end



end
