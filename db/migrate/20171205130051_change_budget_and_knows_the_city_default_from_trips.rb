class ChangeBudgetAndKnowsTheCityDefaultFromTrips < ActiveRecord::Migration[5.1]
  def change
    change_column_default :trips, :budget, from: 3, to: nil
    change_column_default :trips, :knows_the_city, from: 1, to: nil
  end
end
