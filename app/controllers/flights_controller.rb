class FlightsController < ApplicationController
  before_action :require_login

  def index
    @trips = current_user.trips
    @flights = @trips.collect { |trip| trip.flights }
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    if @flight.save
      redirect_to trip_flight_path(current_trip, @flight)
    else
      render :new
    end
  end

  def edit
    @flight = Flight.find(params[:id])
  end

  def update
    @flight = Flight.find(params[:id])
    if @flight.update(flight_params)
      redirect_to trip_flight_path(current_trip, @flight)
  end

  def destroy
    @flight = Flight.find(params[:id])
    @flight.destroy
    redirect_to trip_flights_path(current_trip)
  end

  private

  def flight_params
    params.require(:flight).permit(:airline, :flight_number, :departure_location, :arrival_location,
      :departure_date, :arrival_date, :departure_time, :arrival_time,
      :checked_bags, :cost, :booked)
  end

end
