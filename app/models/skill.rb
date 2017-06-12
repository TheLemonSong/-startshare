class Skill < ApplicationRecord
  has_attachment :icon

  has_many :users
  has_many :roles, through: :projects
  has_many :applications, through: :roles

  # validates :user, presence: :true
  validates :skill, presence: :true
end
