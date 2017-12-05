class RemoveSoloToTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :solo
  end
end
