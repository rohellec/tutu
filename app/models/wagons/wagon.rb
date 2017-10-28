class Wagon < ApplicationRecord
  TYPES = %w[Sitting Econom Coupe Luxe].freeze

  belongs_to :train, optional: true

  validates :ordinal, uniqueness: { scope: :train_id }
  validates :train_id, presence: true
  validates :wagon_type, inclusion: { in: TYPES }

  before_validation :set_type
  before_save :set_ordinal, if: ->(wagon) { wagon.changes["train_id"] }

  private

  TYPES_CLASSES = {
    "Sitting" => "SittingWagon",
    "Econom"  => "EconomWagon",
    "Coupe"   => "CoupeWagon",
    "Luxe"    => "LuxeWagon"
  }.freeze

  def set_ordinal
    self.ordinal = train.wagons.any? ? train.wagons.maximum(:ordinal) + 1 : 1
  end

  def set_type
    self.type = TYPES_CLASSES[wagon_type]
  end
end
