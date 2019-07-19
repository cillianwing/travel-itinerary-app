class TripsController < ApplicationController
  before_action :set_trip!, only: [:show, :edit, :update, :destroy]

  def new

  end

  def create

  end

  def show
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private

  def trip_params
    params.require(:trip).permit(:name, :description, :start_date, :end_date, :total_cost, :user_id)
  end

  def set_trip!
    @trip = Trip.find(params[:id])
  end

end
