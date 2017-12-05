class AddKnowsTheCityToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :knows_the_city, :integer, default: 1
  end
end
