class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :airline
      t.string :flight_number
      t.string :departure_location
      t.string :arrival_location
      t.time :departure_time
      t.time :arrival_time
      t.integer :checked_bags
      t.decimal :cost
      t.boolean :booked
      t.integer :trip_id

      t.timestamps
    end
  end
end
