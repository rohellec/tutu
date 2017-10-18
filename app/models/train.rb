class Train < ApplicationRecord
  belongs_to :current_station, class_name: "RailwayStation", optional: true
  belongs_to :route, optional: true

  has_many :tickets
  has_many :wagons

  def coupe_bottom_places
    wagons.coupe.sum(:bottom_places)
  end

  def coupe_upper_places
    wagons.coupe.sum(:upper_places)
  end

  def open_plan_bottom_places
    wagons.open_plan.sum(:bottom_places)
  end

  def open_plan_upper_places
    wagons.open_plan.sum(:upper_places)
  end
end
