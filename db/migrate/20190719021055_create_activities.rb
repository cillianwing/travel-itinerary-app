class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.string :location
      t.decimal :cost
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.boolean :booked
      t.integer :trip_id

      t.timestamps
    end
  end
end
