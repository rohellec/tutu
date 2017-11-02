class LuxeWagon < Wagon
  validates :bottom_places, presence: true

  def display_name
    "Luxe"
  end
end
