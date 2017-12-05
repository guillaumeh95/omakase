class RemoveCoupleFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :couple, :boolean
  end
end
