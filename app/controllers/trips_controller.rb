class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
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
    params.require(:trip).permit(:date, :solo, :family, :couple, :friends, :sight_seeing_adventurer, :art_lover, :serial_shopper, :nature_lover, :food_addict, :sport_lover, :history_passionate, :tech_fan, :relaxed, :city_wanderer )
  #rajouter le budget, knows city
  end
end


