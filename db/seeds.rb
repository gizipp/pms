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
  work = Work.new
  work.title = Faker::Name.title
  work.description = Faker::Lorem.paragraph(2)
  work.user_id = Faker::Number.between(1,10)
  work.save
end

90.times do
  todo = TodoList.new
  todo.name = Faker::Name.title
  todo.description = Faker::Lorem.paragraph(2)
  todo.work_id = Faker::Number.between(1,30)
  todo.save
end

180.times do
  task = Task.new
  task.name = Faker::Name.title
  task.description = Faker::Lorem.paragraph(2)
  task.due_date = "2015-09-15"
  task.user_id = Faker::Number.between(1,10)
  task.todo_list_id = Faker::Number.between(1,90)
  task.status = Faker::Number.between(0,1)
  task.save
end