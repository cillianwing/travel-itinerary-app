class Flight < ApplicationRecord
  has_many :tickets
  has_many :trips, through: :tickets

  validates :airline, :flight_number, :departure_location, :arrival_location,
    :departure_date, :arrival_date, :departure_time, :arrival_time,
    :checked_bags, :cost, presence: true
end
