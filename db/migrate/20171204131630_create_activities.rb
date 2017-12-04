class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :address
      t.string :photo
      t.boolean :family
      t.boolean :couple
      t.boolean :friends
      t.boolean :solo
      t.boolean :sight_seeing_adventurer
      t.boolean :art_lover
      t.boolean :serial_shopper
      t.boolean :food_addict
      t.boolean :sport_lover
      t.boolean :history_passionate
      t.boolean :tech_fan
      t.boolean :nature_lover
      t.boolean :relaxed
      t.boolean :city_wanderer
      t.boolean :to_book
      t.string :website

      t.timestamps
    end
  end
end
