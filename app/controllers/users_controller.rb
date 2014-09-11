class UsersController < ApplicationController
  validates :username, uniqueness: true
end
