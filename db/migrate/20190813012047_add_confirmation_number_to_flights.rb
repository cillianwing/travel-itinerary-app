class AddConfirmationNumberToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :confirmation_number, :string
  end
end
