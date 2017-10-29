class AddWagonDirectionToTrain < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :head_direction, :boolean
  end
end
