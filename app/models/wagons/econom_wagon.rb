class EconomWagon < Wagon
  validates :bottom_places, presence: true
  validates :upper_places,  presence: true
  validates :side_bottom_places, presence: true
  validates :side_upper_places,  presence: true
end
