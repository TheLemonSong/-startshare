class AddAddressLine2ToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address_line_2, :string
  end
end
