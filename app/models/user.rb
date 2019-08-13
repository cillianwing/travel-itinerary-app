class User < ApplicationRecord
  has_secure_password
  # Relationships
  has_many :trips
  # Validations
  validates :name, :email, :password, presence: true
  validates :username, presence: true, uniqueness: { message: "%{attribute} already taken." }

end
