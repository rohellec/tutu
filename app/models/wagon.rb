class Wagon < ApplicationRecord
  TYPES = {
    sitting: "SittingWagon",
    econom:  "EconomWagon",
    coupe:   "CoupeWagon",
    luxe:    "LuxeWagon"
  }.freeze

  scope :sorted, ->(asc) { order(ordinal: (asc ? :asc : :desc)) }

  belongs_to :train

  validates :ordinal, uniqueness: { scope: :train_id }
  validates :type,    inclusion:  { in: TYPES.values }

  before_save :set_ordinal, if: :train_id_changed?

  private

  def set_ordinal
    self.ordinal = train.wagons.maximum(:ordinal).to_i + 1
  end
end
