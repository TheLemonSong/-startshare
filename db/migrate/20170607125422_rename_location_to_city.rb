class RenameLocationToCity < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :location, :city
    rename_column :users, :residence_country, :residence
  end
end
