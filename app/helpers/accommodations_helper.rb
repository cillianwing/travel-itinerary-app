module AccommodationsHelper

  def arrival_departure_confirm
    if arrival_date > departure_date
      errors.add(:arrival_date, "cannot be after departure date")
    end
  end

  def accommodation_trip_date_confirm
    # confirm flight dates are within the dates of the current trip
    @trip = Trip.find_by(id: self.trip_ids.last)
    if departure_date < @trip.start_date || departure_date > @trip.end_date
      errors.add(:departure_date, "cannot be outside dates of this trip")
    elsif arrival_date < @trip.start_date || arrival_date > @trip.end_date
      errors.add(:arrival_date, "cannot be outside dates of this trip")
    end
  end

end
