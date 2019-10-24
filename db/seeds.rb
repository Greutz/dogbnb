# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cit = []
dog = []
dogsit = []

# Utilise cette ligne de code pour éffacer la bdd à la place d'un destroy
# DatabaseCleaner.clean_with(:truncation, :only => %w[dogs dogsitters strolls cities])

10.times do
  cit << City.create(name: Faker::Address.city)
end
puts "10 villes de crées !"

10.times do
  dogsit << Dogsitter.create(name: Faker::Name.name, city: City.find(rand(1..City.all.size)))
end
puts "10 esclaves des temps modernes de créés !"

10.times do
  dog << Dog.create(name: Faker::Name.middle_name, city: City.find(rand(1..City.all.size)))
end
puts "10 toutous choux de créés !"

10.times do
  Stroll.create(date: Faker::Time.between(from: DateTime.now + 1.day, to: DateTime.now + 30.days, format: :default), dogsitter: dogsit.sample, dog: dog.sample, city: cit.sample)
end
puts "10 ballades de crées !"
