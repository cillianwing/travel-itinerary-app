class Trip < ApplicationRecord
  belongs_to :user
  # will need to add relationship to flights next

end
