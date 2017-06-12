class RoleSkill < ApplicationRecord
  belongs_to :role
  belongs_to :skill

  validates :skill, presence: true
end
