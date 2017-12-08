class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @trips_host = Trip.where(host_id: current_user.id).sort.reverse
    @trips_tourist = Trip.where(tourist_id: current_user.id).sort.reverse

    # Filter incoming and past trips
    @trips_host_incoming = select_incoming_trips(@trips_host)
    @trips_host_past = select_past_trips(@trips_host)
    @trips_tourist_incoming = select_incoming_trips(@trips_tourist)
    @trips_tourist_past = select_past_trips(@trips_tourist)
  end

  private

  # Filter incoming trips
  def select_incoming_trips(all_trips)
    return all_trips.select {|trip| Time.now <= trip.date}
  end

  # Filter past trips
  def select_past_trips(all_trips)
    return all_trips.select {|trip| Time.now > trip.date}
  end
end
