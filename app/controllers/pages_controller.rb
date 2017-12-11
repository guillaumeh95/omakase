class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home] # Can access homepage without logging in

  def home
  end
end
