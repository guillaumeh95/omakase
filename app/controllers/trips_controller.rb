class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :edit, :update, :destroy, :send_email]

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render  pdf:      @trip.tourist_first_name + "_trip_to_paris",   # Excluding ".pdf" extension.
                layout:   'pdf.html.erb'   # Use different layout
      end
    end
  end

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
    setup_activities # find me in app/controllers/application_controller.rb :)
  end

  def update
    # @trip.comment = params[:trip][:comment]
    @trip.save
    redirect_to dashboard_user_path(current_user)
  end

  def destroy
    @trip.destroy
    redirect_to dashboard_user_path(current_user)
  end

  def send_email
    TripMailer.send_trip(@trip).deliver_now # Deliver mail
    @trip.sent = true # Set sent value to true
    @trip.save
    redirect_to dashboard_user_path(current_user)
  end

  private

  def trip_params
    params.require(:trip).permit(:comment, :title, :date, :status, :sight_seeing_adventurer, :art_lover, :serial_shopper, :nature_lover, :food_addict, :sport_lover, :history_passionate, :tech_fan, :relaxed, :city_wanderer, :budget, :knows_the_city )
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


