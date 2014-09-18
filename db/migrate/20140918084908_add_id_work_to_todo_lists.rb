class AddIdWorkToTodoLists < ActiveRecord::Migration
  def change
    add_column :todo_lists, :id_work, :integer
  end
end
