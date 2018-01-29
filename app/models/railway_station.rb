class RailwayStation < ApplicationRecord
  scope :route_ordered, -> {
    joins(:railway_stations_routes).order('railway_stations_routes.position').uniq
  }

  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  def update_position(route, position)
    return unless station_route(route)
    @station_route.position = position
    if @station_route.save
      true
    else
      add_uniq_position_error
      false
    end
  end

  def delete_from(route)
    station_route(route)&.delete
  end

  def position_in(route)
    station_route(route)&.position
  end

  def arrival_time_in(route)
    station_route(route)&.arrival_time&.strftime("%k:%M")
  end

  def departure_time_in(route)
    station_route(route)&.departure_time&.strftime("%k:%M")
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.find_by(route: route)
  end

  private

  def add_uniq_position_error
    errors.add :base, :uniq_position
  end
end
