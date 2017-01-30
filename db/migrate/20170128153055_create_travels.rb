class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.integer :rental_id, foreign_key: true, index: true
      t.datetime :start_time
      t.datetime :end_time
      t.float :distance

      t.timestamps null: false
    end
  end
end
