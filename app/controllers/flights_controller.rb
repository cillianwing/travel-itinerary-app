class FlightsController < ApplicationController
  before_action :require_login

  def index
    @trips = current_user.trips
    @flights = @trips.collect { |trip| trip.flights }
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def create
  end

  def destroy
  end

end
