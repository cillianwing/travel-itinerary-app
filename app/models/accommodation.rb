class Accommodation < ApplicationRecord
  include AccommodationsHelper
  has_many :reservations
  has_many :trips, through: :reservations
end
