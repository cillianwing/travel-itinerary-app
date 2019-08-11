class Flight < ApplicationRecord
  has_many :tickets
  has_many :trips, through: :tickets

  validates :airline, presence: true
  validates :flight_number, presence: true
  validates :departure_location, presence: true
  validates :arrival_location, presence: true
  validates :departure_date, presence: true
  validates :arrival_date, presence: true
  validates :departure_time, presence: true
  validates :arrival_time, presence: true
  validates :checked_bags, presence: true
  validates :cost, presence: true
end
