class Work < ActiveRecord::Base
  belongs_to :users
  has_many :contributors, :through => :appointments
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable, :confirmable and :activatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :title, presence: true
  
  attr_accessor :username
end
