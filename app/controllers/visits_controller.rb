class VisitsController < ApplicationController
  before_action :find_trip, only: [:create, :destroy]
  def create
    @visit = Visit.new
    @visit.trip = @trip
    @visit.activity = Activity.find(params[:activity_id])
    @visit.save
    respond_to do |format|
      format.html { redirect_to edit_trip_path(@trip) }
      format.js do
        setup_activities
      end
    end
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to edit_trip_path(@trip) }
      format.js do
        # Define all the instance variables needed in `create.js.erb`
        setup_activities
        render :create
      end
    end
  end

  private

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def visit_params

  end
end
