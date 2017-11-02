class AddOrdinalToWagons < ActiveRecord::Migration[5.1]
  def change
    add_column :wagons, :ordinal, :integer
  end
end
