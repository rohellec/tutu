class LuxeWagon < Wagon
  validates :bottom_places, presence: true

  def display_name
    "luxe"
  end
end
