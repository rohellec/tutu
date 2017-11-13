class SearchesController < ApplicationController
  def show
    @search_results = SearchTrains.call(params[:base_id], params[:final_id])
  end
end
