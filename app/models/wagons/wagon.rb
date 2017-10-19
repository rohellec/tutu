class Wagon < ApplicationRecord
  TYPES = {
    "Sitting" => "SittingWagon",
    "Econom"  => "EconomWagon",
    "Coupe"   => "CoupeWagon",
    "Luxe"    => "LuxeWagon"
  }.freeze

  belongs_to :train, optional: true

  validates :train_id, presence: true
  validates :type, inclusion: { in: TYPES.values }
end
