class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :make, null: false
      t.integer :model, null: false
      t.integer :vehicle, null: false
      t.integer :engine, null: false
      t.integer :energy, null: false

      t.timestamps null: false
    end
  end
end
