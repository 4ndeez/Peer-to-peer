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
