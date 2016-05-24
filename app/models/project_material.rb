class ProjectMaterial < ActiveRecord::Base
  belongs_to :project
  belongs_to :material
end
