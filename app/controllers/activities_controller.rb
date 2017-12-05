class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find()
  end

  def create
  end

  def update
  end

  def destroy
  end
end
