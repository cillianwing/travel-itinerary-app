class AddNameBiographyLocationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :biography, :text
    add_column :users, :location, :string
  end
end
