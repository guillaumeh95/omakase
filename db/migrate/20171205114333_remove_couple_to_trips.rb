class RemoveCoupleToTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :couple
  end
end
