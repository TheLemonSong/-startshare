# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating projects and users....'
user1 = User.create ({
  email: 'john@john.com',
  password: '123123',
  first_name: 'Bob',
  last_name: 'Smith',
  location: 'London',
  })

proj1 = Project.create ({
  name: 'Gamemaker',
  summary: 'Make games for kids',
  details: 'Create fun and engaging games for kids',
  start_date: '2017-01-01',
  stage: 'Beginner',
  })

proj2 = Project.create ({
  name: 'Kudos',
  summary: 'Gain some kudos for your idea',
  details: 'Use social media to highlight your idea and get some backing for it',
  start_date: '2017-01-01',
  stage: 'Beginner',
  })

proj1.user = user1
proj2.user = user1

user1.save!

proj1.save!
proj2.save!
puts 'Finished!'
