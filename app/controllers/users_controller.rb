class UsersController < ApplicationController
  def dashboard
    @trips = Trip.where(host_id: current_user.id)
  end
end
