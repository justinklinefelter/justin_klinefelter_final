class CreateRaces < ActiveRecord::Migration[5.1]
  def change
    create_table :races do |t|
      t.integer :user_id
      t.string :location_id
      t.integer :event_id

      t.timestamps
    end
  end
end
