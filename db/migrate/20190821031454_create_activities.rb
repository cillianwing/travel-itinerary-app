class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :location
      t.decimal :cost
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.boolean :booked

      t.timestamps
    end
  end
end
