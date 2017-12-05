class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :edit, :update, :destroy]
  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
  end

  def show
  end

  def edit
    @trip.knows_the_city = ""
    @trip.budget = ""
    @trip.status = "checked_status"
    if checked.length == 3
      @profile_one = "form_checked_one"
      @profile_two = "form_checked_two"
      @profile_three = "form_checked_three"
    elsif checked.length == 2
      @profile_one = "form_checked_one"
      @profile_two = "form_checked_two"
      @profile_three = "form_checked_two" || "form_checked_one"
    elsif checked.length == 1
      @profile_one = "form_checked_one"
      @profile_two = "form_checked_one"
      @profile_three = "form_checked_one" || "city_wanderer" || "sight_seeing_adventurer"
    end

    @activities = Activity.where((@profile_one || @profile_two || @profile_three) && @trip.knows_the_city && @trip.budget && @trip.status)

    # @activities_one = Activity.where(@profile_one && @trip.status && @trip.knows_the_city && @trip.budget)
    # @activity_one = "checked_activity"
    # @visit_one = Visit.new(activity: @activity_one, trip: @trip)
    # @activities_two = Activity.where(@profile_two && @trip.status && @trip.knows_the_city && @trip.budget)
    # @activity_two = "checked_activity"
    # @visit_two = Visit.new(activity: @activity_two, trip: @trip)
    # @activities_three = Activity.where(@profile_three && @trip.status && @trip.knows_the_city && @trip.budget)
    # @activity_three = "checked_activity"
    # @visit_three = Visit.new(activity: @activity_three, trip: @trip)
  end

  def update

  end

  def destroy
  end

  private
  def trip_params
    params.require(:trip).permit(:date, :solo, :family, :couple, :friends, :sight_seeing_adventurer, :art_lover, :serial_shopper, :nature_lover, :food_addict, :sport_lover, :history_passionate, :tech_fan, :relaxed, :city_wanderer)
  #rajouter le budget, knows city
  end

  def find_trip
    @trip = Trip.where(params[:id])
  end
end


