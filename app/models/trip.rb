class Trip < ApplicationRecord
  include TripsHelper
  belongs_to :user
  has_many :tickets
  has_many :flights, through: :tickets

  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_before_end_date, :date_confirm

end
