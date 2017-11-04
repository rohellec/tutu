class RailwayStation < ApplicationRecord
  scope :route_ordered, -> {
    joins(:railway_stations_routes).order('railway_stations_routes.position').uniq
  }

  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position)
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).take
  end
end
