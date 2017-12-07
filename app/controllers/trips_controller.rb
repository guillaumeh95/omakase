class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :edit, :update, :destroy]

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.host = current_user

    # Assign tourist_id to new trip depending on existence of user
    if User.find_by(email: params[:trip][:tourist_email])
      @trip.tourist_id = User.find_by(email: params[:trip][:tourist_email]).id
    else
      user = User.invite!(user_params)
      @trip.tourist_id = user.id
    end

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

    @activities_one = @activities.where(@trip.filters[0] => true)
    @activities_two = @activities.where(@trip.filters[1] => true)
    @activities_three = @activities.where(@trip.filters[2] => true)
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
  end

  def user_params
    { first_name: params[:trip][:tourist_first_name], last_name: params[:trip][:tourist_last_name], email: params[:trip][:tourist_email]}
  end

  def find_trip
    @trip = Trip.find(params[:id])
  end
end


