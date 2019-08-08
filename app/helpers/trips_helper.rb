module TripsHelper

  def start_date_before_end_date
    if start_date > end_date
      errors.add(:start_date, "cannot be after end date")
    end
  end

  def date_confirm
    
  end

end
