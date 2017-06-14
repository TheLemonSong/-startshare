class RenameAddressLine1ToAddress < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :address_line_1, :address
  end
end
