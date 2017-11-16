class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :books, through: :reviews
  has_many :reviews

  validates :username, presence: true, length: { maximum: 15}, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 20},
  format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def self.find_or_create_by_omniauth(auth_hash)
    where(email: auth_hash[:info][:email]).first_or_create do |user|
      user.name = auth_hash[:info][:name]
      user.password = SecureRandom.hex
    end
  end

end
