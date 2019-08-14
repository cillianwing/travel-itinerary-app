class Flight < ApplicationRecord
  scope :booked, -> { where(booked: true) }
  has_many :tickets
  has_many :trips, through: :tickets

  validates :airline, :flight_number, :departure_location, :arrival_location, :departure_date, :arrival_date, :departure_time, :arrival_time, :checked_bags, :cost, presence: true

  def book_ticket
    # method to be used once user enters a (booked) flight for a specific trip
    @ticket = Ticket.create(trip_id: current_trip.id, flight_id: @flight.id)
  end

end
