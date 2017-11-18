class Ticket < ApplicationRecord
  belongs_to :base_station,  class_name: "RailwayStation"
  belongs_to :final_station, class_name: "RailwayStation"
  belongs_to :train
  belongs_to :user

  validate :valid_route

  def arrival_time
    final_station.arrival_time_in(train.route)
  end

  def departure_time
    base_station.departure_time_in(train.route)
  end

  protected

  def valid_route
    return if ticket.train.route.pass_through?(base_station, final_station)
    errors.add :base, "Train's №#{train.number} route must pass through " \
      "#{base_station} and #{final_station}"
  end
end
