class Route < ApplicationRecord
  scope :passed_through, ->(base, final) {
    joins("INNER JOIN railway_stations_routes AS base ON routes.id = base.route_id")
      .joins("INNER JOIN railway_stations_routes AS final ON routes.id = final.route_id")
      .where("base.railway_station_id = :base AND final.railway_station_id = :final " \
             "AND base.position < final.position", base: base, final: final)
      .uniq
  }

  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  validates :title, presence: true

  def add_station(params)
    railway_stations_routes.create(params)
  end
end
