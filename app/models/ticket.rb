class Ticket < ApplicationRecord
  belongs_to :base_station,  class_name: "RailwayStation"
  belongs_to :final_station, class_name: "RailwayStation"
  belongs_to :train
  belongs_to :user
end
