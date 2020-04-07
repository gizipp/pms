class AddIdWorkToTodoLists < ActiveRecord::Migration[6.0]
  def change
    add_column :todo_lists, :id_work, :integer
  end
end
