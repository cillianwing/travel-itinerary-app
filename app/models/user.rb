class User < ApplicationRecord
  has_secure_password
  # Relationships
  has_many :trips
  # Validations
  validates :name, :password, presence: true
  validates :email, presence: true, uniqueness: { message: "%{attribute} already taken." }

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(email: auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
    #returns instance of user that was found or just created
  end

end
