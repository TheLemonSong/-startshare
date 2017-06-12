class Application < ApplicationRecord
  belongs_to :role
  belongs_to :user

  has_one :conversation
  # validates :status, presence: true



  validates :user, presence: :true
  validates :role, presence: :true
end
