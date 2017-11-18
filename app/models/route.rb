class Route < ApplicationRecord
  scope :with_stations, ->(*stations) {
    joins(:railway_stations_routes).where("railway_stations_routes.railway_station_id" => stations)
                                   .uniq
  }

  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  validates :title, presence: true

  def self.passed_through(base, final)
    with_stations(base, final).find_all { |route| route.pass_through?(base, final) }
  end

  def add_station(params)
    railway_stations_routes.create(params)
  end

  def pass_through?(base, final)
    iterator = railway_stations.route_ordered.to_enum
    loop do
      iterator.next while iterator.peek != base
      iterator.next while iterator.peek != final
      return true
    end
    false
  end
end
