require 'faker'
require 'open-uri'

puts "resetting database"
Booking.destroy_all
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
photos = ['https://res.cloudinary.com/le-wagon-london-campus-batch-904/image/upload/v1660399641/download_m6vfgc.jpg',
          'https://res.cloudinary.com/le-wagon-london-campus-batch-904/image/upload/v1660399641/images_gm8vb4.jpg',
          'https://res.cloudinary.com/le-wagon-london-campus-batch-904/image/upload/v1660399641/1658782280-3344685-center-3_kdm7o2.jpg',
          'https://res.cloudinary.com/le-wagon-london-campus-batch-904/image/upload/v1660399641/1656456160-halloween-2-michael-myers-dog-costume_mqwqls.jpg',
          'https://res.cloudinary.com/le-wagon-london-campus-batch-904/image/upload/v1660399640/02_Cat_Halloween_Costumes-Beetlejuice_Inline_jq0mlq.jpg',
          'https://res.cloudinary.com/le-wagon-london-campus-batch-904/image/upload/v1660399641/image_vx11lq.webp',
          'https://res.cloudinary.com/le-wagon-london-campus-batch-904/image/upload/v1660399640/2_wbsi7l.jpg',
          'https://res.cloudinary.com/le-wagon-london-campus-batch-904/image/upload/v1660399641/madonna-dog-costume_tng8r5.jpg',
          'https://res.cloudinary.com/le-wagon-london-campus-batch-904/image/upload/v1660399641/cat-halloween-costume-mermaid_zfaeyl.jpg',
          'https://res.cloudinary.com/le-wagon-london-campus-batch-904/image/upload/v1660399641/images-1_ezgchx.webp',
          'https://res.cloudinary.com/le-wagon-london-campus-batch-904/image/upload/v1660399641/1657567974-580413_PS_PAW_BILL_SUIT-scaled_jgpr3u.jpg',
          'https://res.cloudinary.com/le-wagon-london-campus-batch-904/image/upload/v1660399641/81PCVE1OhHL._AC_SL1500__ham1kr.jpg']

36.times do
  longitude = rand(51.500..51.599).round(3)
  latitude = rand(-0.25..0.25).round(3)
  address = Geocoder.search([longitude, latitude])
  c = Costume.create!(
    name: Faker::Company.profession,
    description: Faker::Lorem.paragraph,
    animal_type: %w[dog cat].sample,
    price: rand(4.99..24.99).round - 0.01,
    longitude:,
    latitude:,
    street: address.first.street,
    city: address.first.city,
    user_id: 1
  )
  c.photo.attach(io: URI.open(photos.sample), filename: 'image.jpg')
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
