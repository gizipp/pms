class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.date :due_date
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
