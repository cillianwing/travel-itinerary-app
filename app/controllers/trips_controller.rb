class TripsController < ApplicationController
  before_action :require_login

  def index
    @trips = current_user.trips if check_user
  end

  def new
    @trip = Trip.new(user_id: params[:user_id]) if params[:user_id]
  end

  def create
    @trip = Trip.new(trip_params) if check_user
    if @trip.save
      redirect_to user_trip_path(current_user, @trip)
    else
      render :new
    end
  end

  def show
    @trip = Trip.find(params[:id]) if check_user
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :description, :start_date, :end_date, :user_id)
  end

end
