class TripsController < ApplicationController
  before_action :require_login

  def index
    if current_user.id == params[:user_id].to_i
      @trips = current_user.trips
    else
      redirect_to user_path(current_user), alert: "You cannot view another user's trips."
    end
  end

  def new
    @trip = Trip.new(user_id: params[:user_id]) if params[:user_id]
  end

  def create
    if current_user.id == params[:user_id].to_i
      @trip = Trip.new(trip_params)
      if @trip.save
        redirect_to user_trip_path(current_user, @trip)
      else
        render :new
      end
    else
      redirect_to user_path(current_user), alert: "You cannot view another user's trips."
    end
  end

  def show
    if current_user.id == params[:user_id].to_i
      @trip = Trip.find(params[:id])
    else
      redirect_to user_path(current_user), alert: "You cannot view another user's trips."
    end
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
