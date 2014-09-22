class FixIdUser < ActiveRecord::Migration
  def change
    rename_column :comments, :id_user, :user_id
  end
end
