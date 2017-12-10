class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :edit, :update, :destroy]

  def new
    @trip = Trip.new
  end

  def create
    # Instanciate new trip with all the trip params (including host)
    @trip = Trip.new(trip_params)
    @trip.host = current_user

    # Assign corresponding tourist_id to new trip depending on existence of user in database
    if User.find_by(email: params[:trip][:tourist_email]) # User already exists
      user = User.find_by(email: params[:trip][:tourist_email]) # Get existing user
      assign_tourist(user)
    else # New user
      user = User.invite!(user_params) # Instantiate new user and sends invitation by mail
      assign_tourist(user)
    end

    if @trip.save
      redirect_to edit_trip_path(@trip)
    else
      render :new
    end
  end

  def edit
    # Filter activities by knows_the_city
    @activities = Activity.where(knows_the_city: @trip.knows_the_city)
    # Filter activities by budget
    @activities = @activities.where(budget: @trip.budget)
    # Filter activities by status
    @activities = @activities.where(@trip.status => true)

    count = @trip.visits.count
    if count == 0
      @activities_one = @activities.where(@trip.filters[0] => true)
    elsif count == 1
      # @activity_one = @trip.visits.find_by(activity: { @trip.filters[0] => true }).activity
      @activity_one = @trip.visits[0].activity
      @activities_two = @activities.where(@trip.filters[1] => true)
    elsif count == 2
      # @activity_one = @trip.visits.find_by(activity: { @trip.filters[0] => true }).activity
      # @activity_two = @trip.visits.find_by(activity: { @trip.filters[1] => true }).activity
      @activity_one = @trip.visits[0].activity
      @activity_two = @trip.visits[1].activity
      @activities_three = @activities.where(@trip.filters[2] => true)
    elsif count == 3
      # @activity_one = @trip.visits.find_by(activity: { @trip.filters[0] => true }).activity
      # @activity_two = @trip.visits.find_by(activity: { @trip.filters[1] => true }).activity
      # @activity_three = @trip.visits.find_by(activity: { @trip.filters[0] => true }).activity
      @activity_one = @trip.visits[0].activity
      @activity_two = @trip.visits[1].activity
      @activity_three = @trip.visits[2].activity
    end
  end

  def update
    @trip.save
    redirect_to dashboard_user_path(current_user)
  end

  def destroy
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :date, :status, :sight_seeing_adventurer, :art_lover, :serial_shopper, :nature_lover, :food_addict, :sport_lover, :history_passionate, :tech_fan, :relaxed, :city_wanderer, :budget, :knows_the_city )
  end

  # Hash containing all tourist information
  def user_params
    { first_name: params[:trip][:tourist_first_name], last_name: params[:trip][:tourist_last_name], email: params[:trip][:tourist_email]}
  end

  # Find a trip by id
  def find_trip
    @trip = Trip.find(params[:id])
  end

  # Assign tourist details to Trip
  def assign_tourist(user)
    @trip.tourist_id = user.id
    @trip.tourist_first_name = user.first_name
    @trip.tourist_last_name = user.last_name
    @trip.tourist_email = user.email
  end
end


