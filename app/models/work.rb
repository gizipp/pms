class Work < ActiveRecord::Base
  belongs_to :users
  validates :name, presence: true
end
