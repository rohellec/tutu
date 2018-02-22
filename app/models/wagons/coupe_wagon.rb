class CoupeWagon < Wagon
  validates :bottom_places, presence: true
  validates :upper_places,  presence: true

  def display_name
    "coupe"
  end
end
