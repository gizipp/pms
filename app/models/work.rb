class Work < ActiveRecord::Base
  belongs_to :user
  has_many :contributed_users, through: :contributor
  has_many :contributors
  validates :title, presence: true
  has_many :todo_lists

  attr_accessor :login
end
