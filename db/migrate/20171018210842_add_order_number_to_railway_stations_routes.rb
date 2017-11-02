class AddOrderNumberToRailwayStationsRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :railway_stations_routes, :station_order, :integer
  end
end
