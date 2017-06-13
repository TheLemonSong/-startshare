class Project < ApplicationRecord
  include PgSearch
  multisearchable against: [:name, :summary]

  has_attachment :photo

  belongs_to :user
  has_many :roles, dependent: :destroy

  validates :name, presence: true
  validates :summary, presence: true
  validates :details, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :stage, presence: true
end
