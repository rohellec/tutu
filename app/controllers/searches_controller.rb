class SearchesController < ApplicationController
  def show
    return unless params[:base_id] && params[:final_id]
    base, final = RailwayStation.find(params[:base_id], params[:final_id])
    @search_results = available_trains(base, final).inject([]) do |result, train|
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
