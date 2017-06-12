class CreateRoleSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :role_skills do |t|
      t.references :skill, foreign_key: true
      t.references :role, foreign_key: true
      t.timestamps
    end
  end
end
