class User < ApplicationRecord
  has_secure_password
  # Relationships
  has_many :trips
  # Validations
  validates :name, :password, presence: true
  validates :email, presence: true, uniqueness: { message: "%{attribute} already taken." }

end
