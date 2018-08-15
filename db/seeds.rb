# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Creating 2 test users...'

user1 = User.new(
  email: "example1@gmail.com",
  password: "123456" )
p user1
user1.save!

user2 = User.new(
  email: "example2@gmail.com",
  password: "123456" )
p user2
user2.save!

puts 'Creating 100 fake agencies...'

50.times do
  agency = Agency.new(
    name:    Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    description:  Faker::GameOfThrones.quote,
    user_id: 1
  )
  p agency
  agency.save!
end

50.times do
  agency = Agency.new(
    name:    Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    description:  Faker::GameOfThrones.quote,
    user_id: 2
  )
  p agency
  agency.save!
end
