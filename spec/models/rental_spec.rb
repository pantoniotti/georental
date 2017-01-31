require 'rails_helper'

RSpec.describe Rental, type: :model do

  let(:rental) do
    Rental.new(make: 0, model: 0, vehicle: 0, engine: 1, energy: 1)
  end

  it 'is valid when all params are present' do
    expect(rental.valid?).to be true
  end

  it 'is not valid when some params are missing' do
    rental.make = nil
    expect(rental.valid?).to be false
  end

  it 'has travels' do
    rental.travels.build(rental_id: 1, start_time: 2.days.ago, end_time: DateTime.now, distance: 12.45)
    rental.save!
    expect(rental.travels.count).to eq 1
  end


end
