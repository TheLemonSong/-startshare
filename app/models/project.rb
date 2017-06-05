class Project < ApplicationRecord
  belongs_to :user
  has_many :roles, dependent: :destroy
  # validates :project_name, presence: true,
  #           :project_summary, presence: true,
  #           :project_details, presence: true,
  #           :start_date, presence: true,
  #           :end_date, presence: true,
  #           :project_stage, presence: true,
end
