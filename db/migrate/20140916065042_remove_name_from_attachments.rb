class RemoveNameFromAttachments < ActiveRecord::Migration
  def change
    remove_column :attachments, :name, :datatype
  end
end
