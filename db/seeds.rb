# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

10.times do
  user = User.new
  user.name = Faker::Name.name
  user.username = Faker::Internet.user_name
  user.email = Faker::Internet.safe_email
  user.role = "member"
  user.password = "12345678"
  user.password_confirmation = "12345678"
  user.save
end

30.times do
  task = Task.new
  task.title = Faker::Name.title
  task.description = Faker::Lorem.paragraph(2)
  task.user_id = Faker::Number.number(1)
  task.save
end


