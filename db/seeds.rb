require 'faker'
require 'open-uri'

puts "resetting database"
User.destroy_all
Costume.destroy_all


puts "Seeding Users"
12.times do
  User.create!(
    first_name: Faker::Name.neutral_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '123456'
  )
end

puts "> Generated #{User.count} users"

puts "Seeding Costumes"

36.times do
  c = Costume.create!(
    name: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    animal_type: %w[dog cat].sample,
    user_id: 1
  )
  c.photo.attach(io: URI.open('https://res.cloudinary.com/le-wagon-london-campus-batch-904/image/upload/v1659642713/l2xononnlbfimakzuo7i.jpg'), filename: 'image.jpg')
end

puts "> Generated #{Costume.count} costumes"

puts "Seeing Bookings"

12.times do
  date_start = Faker::Time.forward(days: rand(1..30))
  Booking.create!(
    user_id: User.ids.sample,
    costume_id: Costume.ids.sample,
    date_start:,
    date_end: date_start + rand(1..30).day
  )
end

puts "> Generated #{Booking.count} bookings"
