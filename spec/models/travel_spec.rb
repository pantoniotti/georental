require 'rails_helper'

RSpec.describe Travel, type: :model do

  let(:travel) do
    Travel.new(rental_id: 1, start_time: 2.days.ago, end_time: DateTime.now, distance: 12.45)
  end

  it 'is not valid when some params are missing' do
    travel.rental_id = nil
    expect(travel.valid?).to be false
  end

  it 'is valid when all params are present' do
    expect(travel.valid?).to be true
  end

  it 'loads positions from a file' do
    travel.file = Rails.root.join('spec', 'support', 'travel1.csv')
    data = travel.load_positions_data
    expect(data.count).to eq 24
  end

  it 'filters positions from a data array' do
    travel.file = Rails.root.join('spec', 'support', 'travel1.csv')
    data = travel.load_positions_data
    data = travel.filter_position(data)
    expect(data.count).to eq 19
  end

  it 'create positions in database' do
    travel.file = Rails.root.join('spec', 'support', 'travel1.csv')
    data = travel.load_positions_data
    data = travel.filter_position(data)
    travel.create_positions(data)
    # expect(travel.positions.count).to eq 19
  end

  it 'computes positions data to get coordinates' do
    # travel.file = Rails.root.join('spec', 'support', 'travel1.csv')
    # data = travel.load_positions_data
    # data = travel.filter_position(data)
    # travel.create_positions(data)
    # travel.compute_positions_data
  end



end
