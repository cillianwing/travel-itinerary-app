class Accommodation < ApplicationRecord
  include AccommodationsHelper
  has_many :reservations
  has_many :trips, through: :reservations

  validates :name, :accommodation_type, :location, :arrival_date, :departure_date, :check_in, :check_out, :cost, :address, presence: true
  validate :arrival_departure_confirm, :accommodation_trip_date_confirm

  def book_reservation(trip)
    # method to be used once user enters a (booked) flight for a specific trip
    @reservation = Reservation.create(trip_id: trip.id, accommodation_id: self.id)
  end

end
