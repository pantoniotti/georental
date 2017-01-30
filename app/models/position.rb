class Position < ActiveRecord::Base
  belongs_to :travel, inverse_of: :positions

  with_options presence: true do
    validates :travel_id
    validates :timestamp
    validates :latitude
    validates :longitude
  end

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
