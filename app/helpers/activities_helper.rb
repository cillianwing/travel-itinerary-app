module ActivitiesHelper

  def end_start_confirm
    if start_date > end_date
      errors.add(:start_date, "cannot be after end date")
    end
  end

  def activity_trip_date_confirm
    @trip = Trip.find_by(id: self.trip_ids.last)
    if start_date < @trip.start_date || start_date > @trip.end_date
      errors.add(:start_date, "cannot be outside dates of this trip")
    elsif end_date < @trip.start_date || end_date > @trip.end_date
      errors.add(:end_date, "cannot be outside dates of this trip")
    end
  end

end
