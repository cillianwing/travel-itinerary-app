class CreateAccommodations < ActiveRecord::Migration[5.2]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.string :type
      t.string :location
      t.date :arrival_date
      t.date :departure_date
      t.time :check_in
      t.time :check_out
      t.decimal :cost
      t.string :address
      t.boolean :booked

      t.timestamps
    end
  end
end
