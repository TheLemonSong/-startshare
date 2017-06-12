class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  validates :skill, presence: true
  validates :user_id, :uniqueness => {:scope => :skill_id}

end
