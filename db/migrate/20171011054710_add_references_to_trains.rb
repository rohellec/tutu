class AddReferencesToTrains < ActiveRecord::Migration[5.1]
  def cjange
    change_table :trains do |t|
      t.references :route, foreign_key: true
      t.references :current_station, foreign_key: { to_table: :railway_stations }
    end
  end
end
