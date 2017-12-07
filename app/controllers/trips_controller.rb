class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :edit, :update, :destroy]
  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.host = current_user
    if @trip.save
      redirect_to edit_trip_path(@trip)
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @trip.knows_the_city.present?
      @activities = Activity.where(knows_the_city: @trip.knows_the_city)
    else
      @activities = Activity.all
    end

    if @trip.budget.present?
      @activities = @activities.where(budget: @trip.budget)
    end

    if @trip.status.present?
      @activities = @activities.where(@trip.status => true)
    end

    count = @trip.visits.count
    if count == 0
      @activities_one = @activities.where(@trip.filters[0] => true)
    elsif count == 1
      # @activity_one = @trip.visits.find_by(activity: { @trip.filters[0] => true }).activity
      @activity_one = @trip.visits.all[0].activity
      @activities_two = @activities.where(@trip.filters[1] => true)
    elsif count == 2
      # @activity_one = @trip.visits.find_by(activity: { @trip.filters[0] => true }).activity
      # @activity_two = @trip.visits.find_by(activity: { @trip.filters[1] => true }).activity
      @activity_one = @trip.visits.all[0].activity
      @activity_two = @trip.visits.all[1].activity
      @activities_three = @activities.where(@trip.filters[2] => true)
    elsif count == 3
      # @activity_one = @trip.visits.find_by(activity: { @trip.filters[0] => true }).activity
      # @activity_two = @trip.visits.find_by(activity: { @trip.filters[1] => true }).activity
      # @activity_three = @trip.visits.find_by(activity: { @trip.filters[2] => true }).activity
      @activity_one = @trip.visits.all[0].activity
      @activity_two = @trip.visits.all[1].activity
      @activity_three = @trip.visits.all[2].activity
    end
  end

  def update
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def trip_params
    params.require(:trip).permit(:title, :date, :status, :sight_seeing_adventurer, :art_lover, :serial_shopper, :nature_lover, :food_addict, :sport_lover, :history_passionate, :tech_fan, :relaxed, :city_wanderer, :budget, :knows_the_city )

  #rajouter le budget, knows city
  end

  def find_trip
    @trip = Trip.find(params[:id])
  end
end


