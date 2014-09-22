class Comment < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  has_many :attachments, as: :attachable
end
