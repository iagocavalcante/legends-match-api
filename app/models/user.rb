class User < ApplicationRecord
  extend Devise::Models
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  serialize :preferences, HashSerializer
  serialize :skills, HashSerializer
  # serialize :likes, HashSerializer
  serialize :dislikes, HashSerializer
  serialize :games, HashSerializer

  validates :full_name, presence: true, allow_blank: false
  validates :nickname, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :email, presence: true
  validates :birthday, presence: true
  validates :bio, presence: true
  # validates :games, presence: true
  # validates :skills, presence: true

  def likes=(value)
    self[:likes] = value.is_a?(String) ? JSON.parse(value) : value
  end
end
