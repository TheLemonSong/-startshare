class Role < ApplicationRecord
  belongs_to :project
  has_many :applications, dependent: :destroy

  validates :role_name, presence: true,
  validates :role_description, presence: true,
end
