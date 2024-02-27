puts 'cleaning database'
User.destroy_all
Pokemon.destroy_all
puts 'database cleaned'

puts 'creating 1 user'
User.create!(first_name: "John", last_name: "Doe", credit_card: "123456789", email:'test@test.com' , password: '123456')
puts 'user created'
puts 'creating 1 pokemon'
Pokemon.create!(name: "Pikachu", services: "courses" , price: 100, user_id: User.first.id)
puts 'pokemon created'
