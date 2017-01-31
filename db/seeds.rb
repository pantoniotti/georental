# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rental.create(make: 0, model: 0, vehicle: 5, engine: 1, energy: 1)
Rental.create(make: 0, model: 1, vehicle: 1, engine: 1, energy: 1)
Rental.create(make: 7, model: 6, vehicle: 5, engine: 0, energy: 1)
Rental.create(make: 2, model: 2, vehicle: 2, engine: 1, energy: 2)
Rental.create(make: 8, model: 4, vehicle: 6, engine: 1, energy: 1)
