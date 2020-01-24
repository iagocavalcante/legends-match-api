class User < ApplicationRecord
  extend Devise::Models
  # has_many_attached :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :full_name, presence: true, allow_blank: false
  validates :nickname, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :email, presence: true
  validates :age, presence: true
  validates :bio, presence: true
  validates :games, presence: true
  validates :skills, presence: true
  validates :preferences, presence: true

  def likes=(value)
    self[:likes] = value.is_a?(String) ? JSON.parse(value) : value
  end

  def image_url
    if self.image.attachment
      self.image.attachment.service_url
    end
  end
end
