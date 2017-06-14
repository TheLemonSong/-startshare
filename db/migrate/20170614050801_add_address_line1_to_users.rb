class AddAddressLine1ToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address_line_1, :string
  end
end
