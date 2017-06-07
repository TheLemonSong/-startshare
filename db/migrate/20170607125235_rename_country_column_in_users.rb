class RenameCountryColumnInUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :country, :residence_country
  end
end
