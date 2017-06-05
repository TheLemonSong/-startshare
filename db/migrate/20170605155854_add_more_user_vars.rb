class AddMoreUserVars < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :location, :string
    add_column :users, :LI_url, :string
    add_column :users, :GH_url, :string
  end
end
