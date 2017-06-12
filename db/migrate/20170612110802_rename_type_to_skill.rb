class RenameTypeToSkill < ActiveRecord::Migration[5.0]
  def change
    rename_column :skills, :type, :skill
  end
end
