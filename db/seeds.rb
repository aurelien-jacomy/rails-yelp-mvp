# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "cleaning database"
Restaurant.destroy_all
puts "database empty"

20.times do
  name = Faker::Restaurant.name
  address = Faker::Address.street_address
  phone = Faker::PhoneNumber.cell_phone
  category = ["chinese", "italian", "japanese", "french", "belgian"].sample
  restaurant = Restaurant.new(name: name, address: address, phone_number: phone, category: category)
  restaurant.save
  puts "Restaurant #{restaurant.id} created"
end

puts "#{Restaurant.count} created"

puts "Creating reviews"

restaurants = Restaurant.all

restaurants.each do |restaurant|
  5.times do
    content = Faker::Restaurant.review
    rating = rand(0..5)
    review = Review.new(content: content, rating: rating, restaurant: restaurant)
    review.save
    puts "review #{review.id} created for restaurant #{restaurant.id}"
  end
end

puts "done"
