class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :description
      t.date :start_date
      t.date :end_date
      t.decimal :total_cost
      t.integer :user_id

      t.timestamps
    end
  end
end
