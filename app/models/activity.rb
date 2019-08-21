class Activity < ApplicationRecord
  has_many :bookings
  has_many :trips, through: :bookings

  validates :name, :description, :location, :cost, :start_date, :end_date, :start_time, :end_time, presence: true
end
