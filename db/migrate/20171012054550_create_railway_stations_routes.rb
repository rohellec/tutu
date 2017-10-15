class CreateRailwayStationsRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :railway_stations_routes do |t|
      t.references :railway_station
      t.references :route

      t.timestamps
    end
  end
end
