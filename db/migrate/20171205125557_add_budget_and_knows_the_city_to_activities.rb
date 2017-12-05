class AddBudgetAndKnowsTheCityToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :budget, :integer
    add_column :activities, :knows_the_city, :integer
  end
end
