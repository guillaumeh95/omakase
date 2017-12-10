class VisitsController < ApplicationController
  before_action :find_trip, only: [:create]
  def create
    @visit = Visit.new
    @visit.trip = @trip
    @visit.activity = Activity.find(params[:activity_id])
    @visit.save
    respond_to do |format|
      format.html { redirect_to edit_trip_path(@trip) }
      format.js do
        # Define all the instance variables needed in `create.js.erb`
        @activity_one = @trip.visits[0].activity
        @activity_two = @trip.visits[1].activity
        @activity_three = @trip.visits[2].activity
        @activities = Activity.where(knows_the_city: @trip.knows_the_city)
        @activities = @activities.where(budget: @trip.budget)
        @activities = @activities.where(@trip.status => true)
        @activities_one = @activities.where(@trip.filters[0] => true)
        @activities_two = @activities.where(@trip.filters[1] => true)
        @activities_three = @activities.where(@trip.filters[2] => true)
      end
    end
  end

  private

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end
end
