class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :id_user
      t.text :body
      t.references :task, index: true

      t.timestamps
    end
  end
end
