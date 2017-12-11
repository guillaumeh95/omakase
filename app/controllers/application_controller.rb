class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user! # Devise
  before_action :configure_permitted_parameters, if: :devise_controller? # Devise Invitable

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  private

  def setup_activities
    # Filter activities by knows_the_city
    @activities = Activity.where("knows_the_city <= ?", @trip.knows_the_city)
    # Filter activities by budget
    @activities = @activities.where("budget <= ?", @trip.budget)
    # Filter activities by status
    @activities = @activities.where(@trip.status => true)
    count = @trip.visits.count
    if count == 0
      @activities_one = @activities.where(@trip.filters[0] => true)
    elsif count == 1
      # @activity_one = @trip.visits.find_by(activity: { @trip.filters[0] => true }).activity
      @activity_one = @trip.visits.order(created_at: :asc)[0].activity
      #@activities_two = @activities.where(@trip.filters[1] => true).near(@activity_one.address, 3, order: 'distance')
      @activities_two = filter_activities(@activity_one, @trip.filters[1] => true)
      @activities_two = @activities_two.where.not(id: @activity_one.id)
    elsif count == 2
      # @activity_one = @trip.visits.find_by(activity: { @trip.filters[0] => true }).activity
      # @activity_two = @trip.visits.find_by(activity: { @trip.filters[1] => true }).activity
      @activity_one = @trip.visits.order(created_at: :asc)[0].activity
      @activity_two = @trip.visits.order(created_at: :asc)[1].activity
      #@activities_three = @activities.where(@trip.filters[2] => true).near(@activity_two.address, 3, order: 'distance')
      @activities_three = filter_activities(@activity_one, @trip.filters[1] => true)
      @activities_three = @activities_three.where.not(id: [ @activity_one.id, @activity_two.id ])
    elsif count == 3
      # @activity_one = @trip.visits.find_by(activity: { @trip.filters[0] => true }).activity
      # @activity_two = @trip.visits.find_by(activity: { @trip.filters[1] => true }).activity
      # @activity_three = @trip.visits.find_by(activity: { @trip.filters[0] => true }).activity
      @activity_one = @trip.visits.order(created_at: :asc)[0].activity
      @activity_two = @trip.visits.order(created_at: :asc)[1].activity
      @activity_three = @trip.visits.order(created_at: :asc)[2].activity
    end
  end

  def filter_activities(activity, filter)
    km_range = 3
    activities = []
    while activities.length < 5
      activities = @activities.where(filter).near(activity.address, km_range, order: 'distance')
      km_range += 1
    end
    return activities
  end
end

