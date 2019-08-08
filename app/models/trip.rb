class Trip < ApplicationRecord
  include TripsHelper
  belongs_to :user
  # will need to add relationship to flights next

  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_before_end_date

  # need validation that checks if a new trip has dates that fall within the dates of an existing trip
  # if trip exists, direct user to the existing trip page

end
