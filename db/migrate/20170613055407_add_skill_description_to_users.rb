class AddSkillDescriptionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :skill_decription, :string
  end
end
