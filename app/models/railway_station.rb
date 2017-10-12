class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_and_belongs_to_many :routes
end
