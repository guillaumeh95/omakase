class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.references :trip, foreign_key: true
      t.references :activity, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
