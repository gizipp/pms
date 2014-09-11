class Work < ActiveRecord::Base
  belongs_to :users
  has_many :contributors, :through => :appointments

  validates :title, presence: true
  
  attr_accessor :username
end
