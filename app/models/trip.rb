class Trip < ApplicationRecord
  belongs_to :user
  has_many :activities
  has_many :flights
  has_many :accommodations
  has_many :companions

end
