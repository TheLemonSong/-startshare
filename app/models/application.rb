class Application < ApplicationRecord
  belongs_to :role
  belongs_to :user

  has_one :conversation
  # validates :status, presence: true
  has_many :skills


  validates :user, presence: :true
  validates :role, presence: :true
end
