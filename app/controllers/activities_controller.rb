class ActivitiesController < ApplicationController
  before_action :require_login
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @activities = current_trip.activities.sort_by { |hash| hash[:start_date] && hash[:start_time] }
  end

  def new
    @activity = current_trip.activities.new
  end

  def create
    @activity = current_trip.activities.new(activity_params)
    @activity.trip_ids << current_trip.id
    if @activity.save
      @activity.complete_booking(current_trip)
      current_trip.update_total(@activity.cost)
      redirect_to trip_activity_path(current_trip, @activity)
    else
      @activity.trip_ids.pop
      render :new
    end
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to trip_activity_path
    else
      render :edit
    end
  end

  def destroy
    current_trip.subtract_total(@activity.cost)
    @activity.destroy
    redirect_to trip_activities_path(current_trip)
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :location, :cost, :start_date, :end_date, :start_time, :end_time, :booked)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end

end
