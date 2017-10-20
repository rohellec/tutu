class Wagon < ApplicationRecord
  TYPES = {
    "Sitting" => "SittingWagon",
    "Econom"  => "EconomWagon",
    "Coupe"   => "CoupeWagon",
    "Luxe"    => "LuxeWagon"
  }.freeze

  scope :ordered, -> { order(:ordinal) }
  belongs_to :train, optional: true

  validates :ordinal, uniqueness: { scope: :train_id }
  validates :train_id, presence: true
  validates :type, inclusion: { in: TYPES.values }

  before_save :set_ordinal, if: ->(wagon) { wagon.changes["train_id"] }

  private

  def set_ordinal
    self.ordinal = train.wagons.any? ? train.wagons.ordered.last.ordinal + 1 : 1
  end
end
