class RemoveFamilyFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :family, :boolean
  end
end
