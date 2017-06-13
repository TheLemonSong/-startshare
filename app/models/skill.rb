class Skill < ApplicationRecord
  has_attachment :icon

  has_many :roles, through: :role_skills
  has_many :role_skills, dependent: :destroy

  has_many :users, through: :user_skills
  has_many :user_skills, dependent: :destroy

  has_many :users
  has_many :roles, through: :projects
  has_many :applications, through: :roles

  # validates :user, presence: :true
  validates :skill, presence: :true
end
