require 'rails_helper'

RSpec.describe Position, type: :model do

  let(:position) do
    Position.new(travel_id: 1, timestamp: 0, latitude: 0.0, longitude: 0.0)
  end

  it 'is valid when all params are present' do
    expect(position.valid?).to be true
  end

  it 'is not valid when some params are missing' do
    position.timestamp = nil
    expect(position.valid?).to be false
  end

end
