class CreateUserRaces < ActiveRecord::Migration[5.1]
  def change
    create_table :user_races do |t|
      t.integer :user_id
      t.integer :race_id
      t.string :time
      t.string :body

      t.timestamps
    end
  end
end