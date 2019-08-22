class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :trip_id
      t.integer :accommodation_id

      t.timestamps
    end
  end
end
