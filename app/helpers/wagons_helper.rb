module WagonsHelper
  def with_bottom_places
    [Wagon::TYPES[:econom], Wagon::TYPES[:luxe], Wagon::TYPES[:coupe]].join(",")
  end

  def with_upper_places
    [Wagon::TYPES[:econom], Wagon::TYPES[:coupe]].join(",")
  end

  def economy_places
    Wagon::TYPES[:econom].to_s
  end

  def seat_places
    Wagon::TYPES[:sitting].to_s
  end
end
