# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
require 'faker'

i = 0
10.times do
  i += 1
  puts "Creating user #{i}"
  User.create(
    nickname: Faker::Name.female_first_name,
    email: Faker::Internet.email,
    password: '123456',
  )
end
