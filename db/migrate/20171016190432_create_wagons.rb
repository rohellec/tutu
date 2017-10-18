class CreateWagons < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.references :train, foreign_key: true
      t.string :wagon_type
      t.integer :bottom_places, default: 0
      t.integer :upper_places,  default: 0

      t.timestamps
    end
  end
end
