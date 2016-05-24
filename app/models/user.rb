class User < ActiveRecord::Base
  validates :name, :email, presence: true, uniqueness: true
  has_many :employee_projects
  has_many :projects, through: :employee_projects
end
