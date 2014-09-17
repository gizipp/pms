class Task < ActiveRecord::Base
  belongs_to :todo_list
  belongs_to :user
  has_many :comments
  has_many :attachments, as: :attachable
end
