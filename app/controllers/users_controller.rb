class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @trips_host = Trip.where(host_id: current_user.id).sort.reverse
    @trips_tourist = Trip.where(tourist_id: current_user.id).sort.reverse

    # Filtering incoming and past trips
    @trips_host_incoming = @trips_host.select {|trip| Time.now <= trip.date}
    @trips_host_past = @trips_host.select {|trip| Time.now > trip.date}
    @trips_tourist_incoming = @trips_tourist.select {|trip| Time.now <= trip.date}
    @trips_tourist_past = @trips_tourist.select {|trip| Time.now > trip.date}
  end
end
