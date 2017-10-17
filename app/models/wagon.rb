class Wagon < ApplicationRecord
  COUPE_TYPE = "Coupe".freeze
  OPEN_PLAN_TYPE = "Open-plan".freeze
  VALID_TYPES = [COUPE_TYPE, OPEN_PLAN_TYPE].freeze

  scope :coupe,     -> { where(wagon_type: COUPE_TYPE) }
  scope :open_plan, -> { where(wagon_type: OPEN_PLAN_TYPE) }

  belongs_to :train, optional: true

  validates :train_id,   presence: true
  validates :wagon_type, inclusion: { in: VALID_TYPES }
end
