class RemoveDescriptionFromSkills < ActiveRecord::Migration[5.0]
  def change
    remove_column :skills, :description, :string
  end
end
