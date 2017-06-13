class UserSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  has_many :users
  has_many :skills

  validates :skill, presence: true
  validates :user_id, :uniqueness => {:scope => :skill_id}

end
