class RemoveNameFromAttachments < ActiveRecord::Migration[6.0]
  def change
    remove_column :attachments, :name, :datatype
  end
end
