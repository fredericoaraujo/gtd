class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.text :description
      t.integer :progress
      t.integer :total
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
