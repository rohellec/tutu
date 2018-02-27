class SittingWagon < Wagon
  validates :seat_places, presence: true

  def display_name
    "sitting"
  end
end
