class VisitsController < ApplicationController
  before_action :find_trip, only: [:create]
  def create
    @visit = Visit.new
    @visit.trip = Trip.find(trip_id)
    @visit.activity = Activity.find(activity_id)
  end

  def find_trip
    @trip = Trip.find(params[:id])
  end
end
