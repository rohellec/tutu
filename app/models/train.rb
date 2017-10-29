class Train < ApplicationRecord
  belongs_to :current_station, class_name: "RailwayStation", optional: true
  belongs_to :route, optional: true

  has_many :tickets
  has_many :wagons

  def sorted_wagons
    wagons.sorted(head_direction)
  end
end
