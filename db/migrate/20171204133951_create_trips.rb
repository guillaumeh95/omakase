class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.integer :host_id
      t.integer :tourist_id
      t.string :title
      t.text :comment
      t.boolean :solo, default: false
      t.boolean :family, default: false
      t.boolean :couple, default: false
      t.boolean :friends, default: false
      t.boolean :sight_seeing_adventurer, default: false
      t.boolean :art_lover, default: false
      t.boolean :serial_shopper, default: false
      t.boolean :nature_lover, default: false
      t.boolean :food_addict, default: false
      t.boolean :sport_lover, default: false
      t.boolean :history_passionate, default: false
      t.boolean :tech_fan, default: false
      t.boolean :relaxed, default: false
      t.boolean :city_wanderer, default: false
      t.datetime :date

      t.timestamps
    end
  end
end
