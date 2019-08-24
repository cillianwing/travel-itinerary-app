class ChangeColumnNameTypeInAccommodations < ActiveRecord::Migration[5.2]
  def change
    rename_column :accommodations, :type, :accommodation_type
  end
end
