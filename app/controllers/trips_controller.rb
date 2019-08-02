class TripsController < ApplicationController
  before_action :require_login

  def index
    @trips = current_user.trips
  end

  def new
    @trip = Trip.new
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

end
