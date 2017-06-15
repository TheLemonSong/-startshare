class AddLocatedToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :located, :string
  end
end
