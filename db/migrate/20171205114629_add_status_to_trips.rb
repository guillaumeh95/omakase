class AddStatusToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :status, :string
  end
end
