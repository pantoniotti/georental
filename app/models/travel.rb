require 'csv'

class Travel < ActiveRecord::Base
  belongs_to :rental, inverse_of: :travels
  has_many :positions, inverse_of: :travel

  attr_accessor :file

  accepts_nested_attributes_for :positions

  with_options presence: true do
    validates :rental_id
  end

  def process
    data = load_positions_data
    create_positions(data)
    compute_positions_data
  end

  # Create new position and geocode on validation
  def create_positions(data = [])
    data.each do |d|
      position = Position.where(travel_id: self.id, timestamp: d[:timestamp]).try(:first)
      if position.nil?
        self.positions.build(
            travel_id: self.id,
            timestamp: d[:timestamp],
            latitude: d[:latitude],
            longitude: d[:longitude]
        )
        self.save
      end
    end
  end

  # To get the distance we need to compare previous and
  # current position and retrieve distance from the geocoder
  # distance_between method
  def compute_positions_data
    previous_position = nil
    # positions = Position.where(travel_id: self.id).order(:timestamp)
    positions = self.positions.order(:timestamp)
    distance = 0
    positions.each do |position|
      if previous_position.nil?
        self.start_time = Time.at(position.timestamp)
      else
        distance += Geocoder::Calculations.distance_between(
            [previous_position[:latitude], previous_position[:longitude]],
            [position[:latitude], position[:longitude]])
      end
      self.end_time = Time.at(position.timestamp)
      previous_position = position
    end
    self.distance = distance
    self.save
  end

  # Get timestamps, latitude and longitude from csv
  def load_positions_data
    data = []
    CSV.foreach(self.file, :headers => false, :col_sep => ";") do |row|
      data << { 'timestamp': row[0].to_i,
                'latitude': row[1].to_f,
                'longitude': row[2].to_f
              }
    end
    data
    filter_position(data)
  end

  # Filter out any subsequent duplicate lat and long
  # based on previous timestamp
  def filter_position(data)
    current = nil
    new_data = []
    data.each do |d|
      position = d.dup.delete(:timestamp)
      if current.nil? || current != position
        new_data << d
      end
      current = position
    end
    new_data
  end

end
