class Role < ApplicationRecord
  belongs_to :project
  has_many :applications
  # validates :role_name, presence: true,
  #           :role_description, presence: true,
end
