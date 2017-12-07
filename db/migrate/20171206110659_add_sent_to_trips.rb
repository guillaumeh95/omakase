class AddSentToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :sent, :boolean, default: false
  end
end
