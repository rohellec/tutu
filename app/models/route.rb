class Route < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  validates :title, presence: true

  def add_station(station, position)
    station = RailwayStation.find(station)
    railway_stations_routes.create(railway_station: station, position: position)
  end
end
