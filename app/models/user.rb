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

  def upcoming_trips
    trips = self.trips.where("start_date >= ?", Date.today).order(:start_date)
  end

  def upcoming_flights
    trips = self.trips.where("start_date >= ?", Date.today)
    flights = trips.collect { |trip| trip.flights }.flatten
  end

  def upcoming_accommodations
    trips = self.trips.where("start_date >= ?", Date.today)
    accommodations = trips.collect { |trip| trip.accommodations }.flatten
  end

  def upcoming_activities
    trips = self.trips.where("start_date >= ?", Date.today)
    activities = trips.collect { |trip| trip.activities }.flatten
  end

  def trips_cost(trips)
    trips.inject(0) {|sum, hash| sum + hash[:total_cost] }
  end

end
