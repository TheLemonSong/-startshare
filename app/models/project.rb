class Project < ApplicationRecord
  belongs_to :user
  has_many :roles, dependent: :destroy

  validates :project_name, presence: true,
  validates :project_summary, presence: true,
  validates :project_details, presence: true
  validates :start_date, presence: true,
  #validates :end_date, presence: true,
  validates :project_stage, presence: true,
end
