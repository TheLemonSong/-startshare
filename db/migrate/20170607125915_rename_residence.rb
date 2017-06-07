class RenameResidence < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :residence, :country
  end
end
