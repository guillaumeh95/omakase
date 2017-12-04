class AddDefaultValuesToActivities < ActiveRecord::Migration[5.1]
  def change
    change_column :activities, :family, :boolean, default: false
    change_column :activities, :couple, :boolean, default: false
    change_column :activities, :friends, :boolean, default: false
    change_column :activities, :solo, :boolean, default: false
    change_column :activities, :sight_seeing_adventurer, :boolean, default: false
    change_column :activities, :art_lover, :boolean, default: false
    change_column :activities, :serial_shopper, :boolean, default: false
    change_column :activities, :food_addict, :boolean, default: false
    change_column :activities, :sport_lover, :boolean, default: false
    change_column :activities, :history_passionate, :boolean, default: false
    change_column :activities, :tech_fan, :boolean, default: false
    change_column :activities, :nature_lover, :boolean, default: false
    change_column :activities, :relaxed, :boolean, default: false
    change_column :activities, :city_wanderer, :boolean, default: false
    change_column :activities, :to_book, :boolean, default: false
  end
end
