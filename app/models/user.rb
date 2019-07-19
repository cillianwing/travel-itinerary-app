class User < ApplicationRecord
  has_secure_password
  has_many :trips
  has_many :activities, through: :trips
  has_many :flights, through: :trips
  has_many :accommodations, through: :trips
  has_many :companions, through: :trips

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

end
