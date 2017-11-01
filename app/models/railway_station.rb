class RailwayStation < ApplicationRecord
  scope :route_order, -> {
    joins(:railway_stations_routes).order('railway_stations_routes.station_order')
  }

  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
end
