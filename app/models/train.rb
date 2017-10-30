class Train < ApplicationRecord
  belongs_to :current_station, class_name: "RailwayStation", optional: true
  belongs_to :route, optional: true

  has_many :tickets
  has_many :wagons

  def sorted_wagons
    wagons.sorted(head_direction)
  end

  def count_places(wagon_type, place_type)
    wagon_type = wagon_type.to_s.capitalize
    wagons.where(wagon_type: wagon_type).sum("#{place_type}_places")
  end
end
