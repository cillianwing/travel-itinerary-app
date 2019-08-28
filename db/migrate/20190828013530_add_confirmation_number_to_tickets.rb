class AddConfirmationNumberToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :confirmation_number, :string
  end
end
