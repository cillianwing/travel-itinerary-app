class User < ApplicationRecord
  has_secure_password
  has_many :trips
  has_many :activities, through: :trips
  has_many :flights, through: :trips
  has_many :accommodations, through: :trips
  has_many :companions, through: :trips

end
