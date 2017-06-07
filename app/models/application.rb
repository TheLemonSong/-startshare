class Application < ApplicationRecord
  belongs_to :role
  belongs_to :user
  # validates :status, presence: true
end
