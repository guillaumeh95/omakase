class ActivitiesController < ApplicationController
  def index
    @activities = policy_scope(Activity)
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
