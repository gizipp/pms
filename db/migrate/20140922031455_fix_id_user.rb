class FixIdUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :id_user, :user_id
  end
end
