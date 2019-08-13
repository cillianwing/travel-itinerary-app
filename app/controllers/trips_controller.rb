class TripsController < ApplicationController
  before_action :require_login
  before_action :check_user

  def index
    @trips = current_user.trips
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
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      redirect_to user_trip_path(current_user, @trip)
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to user_trips_path(current_user)
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :description, :start_date, :end_date, :user_id)
  end

end
