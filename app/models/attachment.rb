class Attachment < ActiveRecord::Base
  mount_uploader :name, AttachmentUploader
end
