class Trail < ApplicationRecord
  has_many :trip_trails
  has_many :trips, through: :trip_trails

  def calc_trips
    trips.count
  end
end
