class Trip < ApplicationRecord
  include TripsHelper
  scope :past_trips, -> { where("end_date < ?", Date.today) }
  scope :upcoming_trips, -> { where("start_date > ?", Date.today) }
  belongs_to :user
  has_many :tickets
  has_many :flights, through: :tickets
  has_many :bookings
  has_many :activities, through: :bookings
  has_many :reservations
  has_many :accommodations, through: :reservations

  validates :name, :description, :start_date, :end_date, presence: true
  validate :start_date_before_end_date, :date_confirm

  def update_total(expense)
    self.update(total_cost: self.total_cost += expense)
  end

  def subtract_total(expense)
    self.update(total_cost: self.total_cost -= expense)
  end

  def select_image
    month = self.start_date.to_s.split("-")[1].to_i
    if month == 1
      image_url = "trip1.jpg"
    elsif month == 2
      image_url = "trip2.jpg"
    elsif month == 3
      image_url = "trip3.jpg"
    elsif month == 4
      image_url = "trip4.jpg"
    elsif month == 5
      image_url = "trip5.jpg"
    elsif month == 6
      image_url = "trip6.jpg"
    elsif month == 7
      image_url = "trip7.jpg"
    elsif month == 8
      image_url = "trip8.jpg"
    elsif month == 9
      image_url = "trip9.jpg"
    elsif month == 10
      image_url = "trip10.jpg"
    elsif month == 11
      image_url = "trip11.jpg"
    elsif month == 12
      image_url = "trip12.jpg"
    end
  end

end
