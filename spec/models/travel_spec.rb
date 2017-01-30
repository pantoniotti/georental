require 'rails_helper'

RSpec.describe Travel, type: :model do

  # filename = Rails.root.join('data', 'positions_6118_csv.csv')

  let(:rental) do
    Rental.new(make: 0, model: 0, vehicle: 0, engine: 1, energy: 1)
  end

  let(:travel) do
    Travel.new(rental_id: 1, start_time: 2.days.ago, end_time: DateTime.now, distance: 12.45)
  end

  let(:travel_missing_rental) do
    Travel.new
  end

  it 'is not valid when some params are missing' do
    expect(travel_missing_rental.valid?).to be false
  end

  it 'is valid when all params are present' do
    expect(travel.valid?).to be true
  end

end
