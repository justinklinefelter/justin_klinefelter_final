class AddRaceCountToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :races_count, :integer
  end
end
