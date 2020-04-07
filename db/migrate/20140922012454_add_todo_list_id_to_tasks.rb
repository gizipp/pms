class AddTodoListIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :todo_list_id, :integer
  end
end
