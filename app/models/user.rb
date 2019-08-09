class User < ApplicationRecord
  has_secure_password
  # Relationships
  has_many :trips
  has_many :flights, through: :trips
  # Validations
  validates :username, presence: true, uniqueness: { message: "%{attribute} already taken." }
  validates :email, presence: true
  validates :password, presence: true

end
