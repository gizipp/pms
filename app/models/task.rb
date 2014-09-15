class Task < ActiveRecord::Base
  belongs_to :todo_list
  #has_many :comments
  #has_many :attachments
end
