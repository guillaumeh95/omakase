class RemoveSoloFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :solo, :boolean
  end
end
