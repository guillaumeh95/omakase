class RemoveFamilyToTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :family
  end
end
