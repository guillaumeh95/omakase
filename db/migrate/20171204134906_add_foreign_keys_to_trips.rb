class AddForeignKeysToTrips < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :trips, :users, column: :tourist_id
    add_foreign_key :trips, :users, column: :host_id
  end
end
