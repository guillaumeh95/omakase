class VisitsController < ApplicationController
  before_action :find_trip, only: [:create]
  def create
    @visit = Visit.new
    @visit.trip = @trip
    @visit.activity = Activity.find(params[:activity_id])
    @visit.save
    respond_to do |format|
      format.html { redirect_to edit_trip_path(@trip) }
      format.js
    end
  end

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end
end
