class Work < ActiveRecord::Base
  belongs_to :user
  has_many :contributed_users, through: :contributor
  has_many :contributors
  has_many :todo_lists

  validates :title, presence: true
  attr_accessor :login
end
