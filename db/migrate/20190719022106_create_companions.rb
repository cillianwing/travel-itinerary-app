class CreateCompanions < ActiveRecord::Migration[5.2]
  def change
    create_table :companions do |t|
      t.boolean :confirmed
      t.boolean :trip_id

      t.timestamps
    end
  end
end
