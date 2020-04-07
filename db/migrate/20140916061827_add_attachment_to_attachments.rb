class AddAttachmentToAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :attachments, :attachment, :string
  end
end
