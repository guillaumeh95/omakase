class RemoveFriendsToTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :friends
  end
end
