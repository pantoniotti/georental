# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rental.create(make: 0, model: 4, vehicle: 0, engine: 0, energy: 0)
Rental.create(make: 0, model: 0, vehicle: 1, engine: 0, energy: 1)
Rental.create(make: 0, model: 4, vehicle: 2, engine: 0, energy: 2)
Rental.create(make: 0, model: 0, vehicle: 3, engine: 1, energy: 0)
Rental.create(make: 0, model: 0, vehicle: 4, engine: 1, energy: 2)