class AccommodationsController < ApplicationController
  before_action :require_login
  before_action :set_accommodation, only: [:show, :edit, :update, :destroy]

  def index
    @accommodations = current_trip.accommodations.sort_by { |hash| hash[:arrival_date] }
    binding.pry
  end

  def show
  end

  def new
    @accommodation = current_trip.accommodations.new
  end

  def create
    @accommodation = current_trip.accommodations.new(accommodation_params)
    @accommodation.trip_ids << current_trip.id
    if @accommodation.save
      @accommodation.book_reservation(current_trip)
      current_trip.update_total(@accommodation.cost)
      redirect_to trip_accommodation_path(current_trip, @accommodation)
    else
      @accommodation.trip_ids.pop
      render :new
    end
  end

  def edit
  end

  def update
    if @accommodation.update(accommodation_params)
      redirect_to trip_accommodation_path
    else
      render :edit
    end
  end

  def destroy
    current_trip.subtract_total(@accommodation.cost)
    @accommodation.destroy
    redirect_to trip_accommodations_path(current_trip)
  end

  private

  def accommodation_params
    params.require(:accommodation).permit(:name, :accommodation_type, :location, :arrival_date, :departure_date, :check_in, :check_out, :cost, :address, :booked)
  end

  def set_accommodation
    @accommodation = Accommodation.find(params[:id])
  end

end
