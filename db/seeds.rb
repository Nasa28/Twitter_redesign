# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# User.create!(username: "Nasa", full_name: "chinasa Agu",
#   email: "chinas1a@gmail.com",
#   password:
#   "111111",
#   password_confirmation: "111111")
#   # Generate a bunch of additional users.
#   20.times do |n|
 
#   full_name = Faker::Name.name
#   email = "chinas1a-#{n+1}@gmail.com"
#   password = "password"
#   username = "Nasa-#{n+1}"
#   User.create!(username: username, full_name: full_name,
#   email: email,
#   password:
#   password,
#   password_confirmation: password)
#   end

users = User.order(:created_at).take(10)
50.times do |t|
 
text = Faker::Lorem.sentence
users.each { |user| user.tweets.create!(text: text) }
end