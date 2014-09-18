class Contributor < ActiveRecord::Base
  belongs_to :work
  belongs_to :user
end
