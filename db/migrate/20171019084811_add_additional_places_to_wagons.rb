class AddAdditionalPlacesToWagons < ActiveRecord::Migration[5.1]
  def change
    change_table :wagons do |t|
      t.integer :side_bottom_places
      t.integer :side_upper_places
      t.integer :seat_places
      t.string :type

      t.change_default :bottom_places, from: 0, to: nil
      t.change_default :upper_places,  from: 0, to: nil
    end

    reversible do |dir|
      dir.up do
        remove_column :wagons, :wagon_type
      end

      dir.down do
        add_column :wagons, :wagon_type, :string
      end
    end
  end
end
