class Rental < ActiveRecord::Base
  has_many :travels, inverse_of: :rental, foreign_key: :rental_id

  enum make: %w(Honda Kia Nissan Hyundai Wolkswagen Ford Peugeot Bmw Dodge)
  enum model: %w(CRV Civic Prius Charger Grand-caravan 106 320i)
  enum vehicle: %w(Economic Compact Mid-size Full-size SUV Luxury Minivan)
  enum engine: %w(Manual Automatic)
  enum energy: %w(Electricity Gaz Hybrid)

  with_options presence: true do
    validates :make
    validates :model
    validates :vehicle
    validates :engine
    validates :energy
  end

end
