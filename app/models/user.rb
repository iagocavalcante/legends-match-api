class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true, length: { minimum: 8 }
  validates :birthday, presence: true
  validates :bio, presence: true
  # validates :games, presence: true
  # validates :skills, presence: true
end