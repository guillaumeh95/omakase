class RemoveFriendsFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :friends, :boolean
  end
end
