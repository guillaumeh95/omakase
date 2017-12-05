class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @trips_host = Trip.where(host_id: current_user.id)
    @trips_tourist = Trip.where(tourist_id: current_user.id)
  end
end
