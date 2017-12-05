class AddBudgetToTrip < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :budget, :integer, default: 3
  end
end
