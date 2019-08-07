class Trip < ApplicationRecord
  belongs_to :user
  # will need to add relationship to flights next

  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true, uniqueness: true
  validates :end_date, presence: true, uniqueness: true

end
