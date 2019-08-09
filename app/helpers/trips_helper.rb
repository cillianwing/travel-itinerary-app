module TripsHelper

  def start_date_before_end_date
    if start_date > end_date
      errors.add(:start_date, "cannot be after end date")
    end
  end

  def date_confirm
    Trip.all.each do |trip|
      if start_date > trip.start_date && start_date < trip.end_date
        errors.add(:start_date, "cannot be during an existing trip")
      elsif end_date > trip.start_date && end_date < trip.end_date
        errors.add(:end_date, "cannot be during an existing trip")
      end
    end
  end

end
