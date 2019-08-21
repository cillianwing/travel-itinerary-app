class Activity < ApplicationRecord
  has_many :bookings
  has_many :trips, through: :bookings

  validates :name, :description, :location, :cost, :start_date, :end_date, :start_time, :end_time, presence: true

  def complete_booking(trip)
    @booking = Booking.create(trip_id: trip.id, activity_id: self.id)
  end

end
