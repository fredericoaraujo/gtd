class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :deadline
      t.boolean :completed
      t.text :context
      t.references :priority, null: false, foreign_key: true
      t.references :category, null: true, foreign_key: true
      t.references :label, null: true, foreign_key: true
      t.references :goal, null: true , foreign_key: true

      t.timestamps
    end
  end
end
