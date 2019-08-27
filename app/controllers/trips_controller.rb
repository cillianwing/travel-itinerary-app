class TripsController < ApplicationController
  before_action :require_login
  before_action :check_user
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = current_user.upcoming_trips
    flash.now[:alert] = "You currently do not have any trips booked." if @trips.size == 0
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to user_trip_path(current_user, @trip)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to user_trip_path(current_user, @trip)
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to user_trips_path(current_user)
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :description, :start_date, :end_date, :user_id, :total_cost)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

end
