class Trip < ApplicationRecord
  include TripsHelper
  scope :past_trip, -> { where("end_date < ?", Date.today) }
  belongs_to :user
  has_many :tickets
  has_many :flights, through: :tickets

  validates :name, :description, :start_date, :end_date, presence: true
  validate :start_date_before_end_date, :date_confirm

  def update_total(expense)
    self.update(total_cost: self.total_cost += expense)
  end

end
