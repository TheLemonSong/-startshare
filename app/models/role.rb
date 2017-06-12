class Role < ApplicationRecord
  has_attachment :icon

  belongs_to :project
  has_many :applications, dependent: :destroy
  has_many :role_skills
  has_many :skills, through: :role_skills
  has_many :conversations, dependent: :destroy

  has_many :role_skills
  has_many :skills, through: :role_skills


  validates :name, presence: true
  validates :description, presence: true
end
