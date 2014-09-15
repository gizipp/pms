class TodoList < ActiveRecord::Base
  belongs_to :work
  has_many :tasks
end
