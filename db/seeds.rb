# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(email: "john@live.com", password: "12345687", age: 20, username: "John")
user.save
# byebug
pet = Pet.new(name: "barker", species: "dog", toilet_trained: true, description: "very detailed infromation", price_per_day: 10, user: user)
pet.save
