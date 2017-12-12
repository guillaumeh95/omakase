class TripsController < ApplicationController
  before_action :find_trip, only: [:show, :edit, :update, :destroy, :send_email]

  def show
    @static_map = get_static_map(@trip) # Generate static map
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
    @trip.comment = "" #initialize empty comment so that it doesn't crach
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
    if params[:trip]
      @trip.comment = params[:trip][:comment]
      setup_activities
      render :edit
    else
      @trip.save
      redirect_to dashboard_user_path(current_user)
    end
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

  # Create url to generate a static map with inputs defined below
  def get_static_map(trip)
    coordinates = []
    trip.activities.each { |activity| coordinates << {lat: activity.latitude, lng: activity.longitude } }
    size = "640x640"
    if @trip.visits.count == 3
      marker_one = "color:blue%7Clabel:A%7C#{coordinates[0][:lat]},#{coordinates[0][:lng]}"
      marker_two = "color:blue%7Clabel:B%7C#{coordinates[1][:lat]},#{coordinates[1][:lng]}"
      marker_three = "color:blue%7Clabel:C%7C#{coordinates[2][:lat]},#{coordinates[2][:lng]}"
      return "https://maps.googleapis.com/maps/api/staticmap?size=#{size}0&maptype=roadmap&markers=#{marker_one}&markers=#{marker_two}&markers=#{marker_three}&key=#{ENV['GOOGLE_API_STATIC_KEY']}"
    end
  end
end


