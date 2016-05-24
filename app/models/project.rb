class Project < ActiveRecord::Base
  has_many :employee_projects
  has_many :users, through: :employee_projects
  has_many :materials
end
