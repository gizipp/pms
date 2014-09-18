class AddWorkIdToTodoLists < ActiveRecord::Migration
  def change
    add_column :todo_lists, :work_id, :integer
  end
end
