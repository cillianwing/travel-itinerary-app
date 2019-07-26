class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :airline
      t.string :flight_number
      t.string :departure_location
      t.string :arrival_location
      t.date :departure_date
      t.date :arrival_date
      t.time :departure_time
      t.time :arrival_time
      t.integer :checked_bags
      t.decimal :cost
      t.boolean :booked

      t.timestamps
    end
  end
end
