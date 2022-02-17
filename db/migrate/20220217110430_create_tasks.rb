class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.boolean :favourite
      t.integer :status, default: 0
      t.date :due_date

      t.timestamps
    end
  end
end
