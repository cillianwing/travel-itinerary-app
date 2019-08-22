class Flight < ApplicationRecord
  include FlightsHelper
  has_many :tickets
  has_many :trips, through: :tickets

  validates :airline, :flight_number, :departure_location, :arrival_location, :departure_date, :arrival_date, :departure_time, :arrival_time, :checked_bags, :cost, presence: true
  validates :flight_number, :confirmation_number, length: { maximum: 6 }
  validate :arrival_departure_confirm, :flight_trip_date_confirm

  def book_ticket(trip)
    # method to be used once user enters a (booked) flight for a specific trip
    @ticket = Ticket.create(trip_id: trip.id, flight_id: self.id)
  end

end
