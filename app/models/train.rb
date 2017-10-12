class Train < ApplicationRecord
  has_many :tickets
  belongs_to :current_station, class_name: "RailwayStation"
  belongs_to :route
end
