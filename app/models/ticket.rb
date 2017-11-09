class Ticket < ApplicationRecord
  belongs_to :base_station,  class_name: "RailwayStation"
  belongs_to :final_station, class_name: "RailwayStation"
  belongs_to :train
  belongs_to :user

  def arrival_time
    final_station.arrival_time_in(train.route)
  end

  def departure_time
    base_station.departure_time_in(train.route)
  end
end
