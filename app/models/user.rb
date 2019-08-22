class User < ApplicationRecord
  has_secure_password
  # Relationships
  has_many :trips
  # Validations
  validates :password, presence: true
  validates :email, presence: true, uniqueness: { message: "%{attribute} already taken." }

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(email: auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
    #returns instance of user that was found or just created
  end

  def all_trips_cost(trips)
    trips.inject(0) {|sum, hash| sum + hash[:total_cost] }
  end

end
