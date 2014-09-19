class RemoveIdWorkFromTodoLists < ActiveRecord::Migration
  def change
    remove_column :todo_lists, :id_work, :integer
  end
end
