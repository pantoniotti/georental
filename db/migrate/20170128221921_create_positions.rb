class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.integer :travel_id
      t.string :address
      t.integer :timestamp
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
