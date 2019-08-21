module TripsHelper

  def start_date_before_end_date
    if start_date > end_date
      errors.add(:start_date, "cannot be after end date")
    end
  end

  def date_confirm
    @user = User.find_by(id: self.user_id)
    @user.trips.each do |trip|
      if trip.id != self.id
        if start_date > trip.start_date && start_date < trip.end_date
          errors.add(:start_date, "#{:start_date.to_s.split("_").join(" ").capitalize} cannot be during an existing trip.")
        elsif end_date > trip.start_date && end_date < trip.end_date
          errors.add(:end_date, "#{:end_date.to_s.split("_").join(" ").capitalize} cannot be during an existing trip.")
        elsif start_date < trip.start_date && end_date > trip.end_date
          errors.add(:trip_dates, "#{:trip_dates.to_s.split("_").join(" ").capitalize} cannot be overlapping with an existing trip.")
        end
      end
    end
  end

end

#{attr.to_s.split("_").join(" ").capitalize}
