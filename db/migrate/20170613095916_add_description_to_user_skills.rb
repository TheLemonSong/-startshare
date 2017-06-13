class AddDescriptionToUserSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :user_skills, :description, :string
  end
end
