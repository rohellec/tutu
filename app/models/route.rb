class Route < ApplicationRecord
  has_many :trains
  has_and_belongs_to_many :railway_stations

  validates :title, presence: true
end
