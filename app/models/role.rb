class Role < ApplicationRecord
  belongs_to :project
  has_many :applications, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
