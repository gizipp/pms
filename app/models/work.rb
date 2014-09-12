class Work < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  
  attr_accessor :login
end
