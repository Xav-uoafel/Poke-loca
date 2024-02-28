puts 'cleaning database'
User.destroy_all
Pokemon.destroy_all
puts 'database cleaned'

services = %w[Courses Parking Promenade Babysitting Massage Menage Jardinage Avocat Tueur-a-gages Massage+ Escort Braquage Ami]
require 'open-uri'
require 'json'
file = File.read('db/pokemons.json')
pokemons = JSON.parse(file)

puts 'creating 3 user'
User.create!(first_name: "John", last_name: "Doe", credit_card: "123456789", email:'test@test.com' , password: '123456')
User.create!(first_name: "Jane", last_name: "Doe", credit_card: "987654321", email:'test1@test.com' , password: '123456')
User.create!(first_name: "Jack", last_name: "Doe", credit_card: "123456789", email:'test2@test.com' , password: '123456')
puts 'user created'

puts 'creating 151 pokemon'
index = 0
151.times do
  pokemon = Pokemon.new(name: pokemons[index]['name']['fr'], services: services.sample, price: rand(10..100), type_pokemon: pokemons[index]['types'][0]['name'])
  pokemon.picture.attach(io: URI.open(pokemons[index]['sprites']['regular']), filename: 'pokemon.jpg', content_type: 'image/jpg')
  pokemon.save!
  puts "pokemon #{index}--#{pokemon.name} created"
index += 1
end

puts 'pokemon created'
puts 'creating 10 bookings'
10.times do
  Booking.create!(user_id: rand(User.first.id..User.last.id), pokemon_id: rand(Pokemon.first.id..Pokemon.last.id), total_price: 100, start_date: Date.today, end_date: Date.today + 5)
end
puts 'bookings created'
