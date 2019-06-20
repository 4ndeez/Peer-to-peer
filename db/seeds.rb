# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = ['Brest', 'Vitebsk', 'Gomel', 'Grodno', 'Minsk region', 'Mogilev', 'Minsk', 'None']
indexes = [224000, 210000, 246000, 230000, 223010, 212000, 220000, nil]

cities.each_with_index do |city, index|
  City.create(name: city, index: indexes[index])
end

emails = ['user@p2p.example', 'moderator@p2p.example', 'admin@p2p.example']

User.roles.keys.each_with_index do |role, index, user = User.new|
  user.email = emails[index]
  user.nickname = Faker::TvShows::RickAndMorty.character
  user.first_name = Faker::Name.first_name
  user.second_name = Faker::Name.last_name
  user.role = role
  user.encrypted_password = '$2a$11$w3tai7ejKU89Em1cH8NFLeZ2NgZd39jzM4JLFWCIqazatYYlv6vKS'
  user.confirmed_at = Time.now
  user.city_id = City.last.id
  user.save(validate: false)
end

# User.create(email: 'user@p2p.example', nickname: Faker::TvShows::RickAndMorty.character, first_name: Faker::Name.first_name,
#             second_name: Faker::Name.last_name, role: 'user', encrypted_password: '$2a$11$w3tai7ejKU89Em1cH8NFLeZ2NgZd39jzM4JLFWCIqazatYYlv6vKS',
#             confirmed_at: Time.now, city_id: City.last.id)
