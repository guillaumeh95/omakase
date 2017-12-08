class AddTouristNameToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :tourist_first_name, :string
    add_column :trips, :tourist_last_name, :string
  end
end
