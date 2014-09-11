class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]
  attr_accessor :username

  #validation
  validates :username, presence: true
  validates :username, uniqueness: true, if: -> { self.username.present? }

  #validate role
  validates :role, inclusion: { in: %w(member admin), message: "%{value} is not a valid role" }
end
