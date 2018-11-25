class CreateRacesHomepages < ActiveRecord::Migration[5.1]
  def change
    create_table :races_homepages do |t|
      t.integer :race_id
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end
  end
end
