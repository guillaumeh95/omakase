class AddTouristEmailToTrips < ActiveRecord::Migration[5.1]
  def change
      add_column :trips, :tourist_email, :string
  end
end
