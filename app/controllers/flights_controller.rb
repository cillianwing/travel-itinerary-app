class FlightsController < ApplicationController
  before_action :require_login
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  def index
    @flights = current_trip.flights.sort_by { |hash| hash[:departure_date] && hash[:departure_time] }
  end

  def show
  end

  def new
    @flight = current_trip.flights.new
  end

  def create
    @flight = current_trip.flights.new(flight_params)
    @flight.trip_ids << current_trip.id
    if @flight.save
      @flight.book_ticket(current_trip)
      current_trip.update_total(@flight.cost)
      redirect_to trip_flight_path(current_trip, @flight)
    else
      @flight.trip_ids.pop
      render :new
    end
  end

  def edit
  end

  def update
    if @flight.update(flight_params)
      redirect_to trip_flight_path
    else
      render :edit
    end
  end

  def destroy
    current_trip.subtract_total(@flight.cost)
    @flight.destroy
    redirect_to trip_flights_path(current_trip)
  end

  private

  def flight_params
    params.require(:flight).permit(:airline, :flight_number, :departure_location, :arrival_location,
      :departure_date, :arrival_date, :departure_time, :arrival_time,
      :checked_bags, :cost, :booked, :confirmation_number, :trip_id)
  end

  def set_flight
    @flight = Flight.find(params[:id])
  end

end
