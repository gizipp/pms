class UsersController < ApplicationController
  validates :username, presence: true
  validates :username, uniqueness: true, if: -> { self.username.present? }
  
  #validate role (test)
  #VALID_STATES = ["member", "admin"]
  #SELECT_STATES = VALID_STATES.map { |s| [s.capitalize, s] }
  #validates :role, :inclusion => { :in => Model::VALID_STATES }

  #validate role
  validates :role, inclusion: { in: %w(member admin), message: "%{value} is not a valid role" }
end
