class Activity < ApplicationRecord
  include ActivitiesHelper
  has_many :bookings
  has_many :trips, through: :bookings

  validates :name, :description, :location, :cost, :start_date, :end_date, :start_time, :end_time, presence: true
  validate :end_start_confirm, :activity_trip_date_confirm

  def complete_booking(trip)
    @booking = Booking.create(trip_id: trip.id, activity_id: self.id)
  end

end
