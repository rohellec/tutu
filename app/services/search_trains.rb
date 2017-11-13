class SearchTrains
  class << self
    def call(base_id, final_id)
      return unless base_id && final_id
      base, final = RailwayStation.find(base_id, final_id)
      available_trains(base, final).inject([]) do |result, train|
        result << { train: train, route: train.route, base_station: base, final_station: final }
      end
    end

    private

    def available_trains(base, final)
      Route.passed_through(base, final).inject([]) do |result, route|
        result.concat(route.trains)
      end
    end
  end
end
