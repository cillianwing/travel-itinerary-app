class Companion < ApplicationRecord
  belongs_to :trip
  has_many :users
  
end
