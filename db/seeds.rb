# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'date'

# seed for users

12.times do
  User.create!(
    first_name: Faker::Name.neutral_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456'
    # is_owner: [true, false].sample
  )
end

puts "You have created #{User.count} users.."

# seed for costumes

36.times do
  Costume.create!(
    name: Faker::Name.name,
    description: "lorem ipsum",
    animal_type: %w[dog cat].sample,
    user_id: 1
  )
end

puts "You have know #{Costume.count} costumes to rent.."

# seed for bookings

12.times do
  Booking.create!(
    user_id: User.ids.sample,
    costume_id: Costume.ids.sample,
    date_start: Date.new(2022, 7, 31),
    date_end: Date.new(2022, 8, 1)
  )
end

puts "Start preparing to ship your costumes. You have now #{Booking.count} reservations."
