class EmployeeProject < ActiveRecord::Base
  validates :user_id, :project_id, presence: true
  belongs_to :user
  belongs_to :project
end
