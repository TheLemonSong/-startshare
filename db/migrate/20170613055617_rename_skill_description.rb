class RenameSkillDescription < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :skill_decription, :skill_description
  end
end
