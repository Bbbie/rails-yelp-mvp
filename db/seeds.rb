require 'faker'

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."

sample_category = ["chinese", "italian", "japanese", "french", "belgian"]

10.times do
  restaurant = Restaurant.create!(name: Faker::Restaurant.name, address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.cell_phone_in_e164, category: sample_category.sample)
  puts "Created #{restaurant.name}"
end

puts "Finished!"
