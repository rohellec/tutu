class Wagon < ApplicationRecord
  TYPES = {
    "Sitting" => "SittingWagon",
    "Econom"  => "EconomWagon",
    "Coupe"   => "CoupeWagon",
    "Luxe"    => "LuxeWagon"
  }.freeze

  scope :sorted, ->(asc) { order(ordinal: (asc ? :asc : :desc)) }
  belongs_to :train, optional: true

  validates :ordinal, uniqueness: { scope: :train_id }
  validates :train_id, presence: true
  validates :type, inclusion: { in: TYPES.values }

  before_save :set_ordinal, if: ->(wagon) { wagon.changes["train_id"] }

  def display_name
    TYPES.find { |_key, value| value == type }.first
  end

  private

  def set_ordinal
    self.ordinal = train.wagons.any? ? train.wagons.maximum(:ordinal) + 1 : 1
  end
end
