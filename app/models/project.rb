class Project < ActiveRecord::Base
  has_many :employee_projects, dependent: :destroy
  has_many :users, through: :employee_projects
  has_many :project_materials, dependent: :destroy
  has_many :materials, through: :project_materials

  def get_material_count
    mats = []
    materials_count = Hash.new(0)

    self.materials.each{ |m| mats << [m.name, m.amount, m.id] }
    mats.each{ |key| materials_count[key]+=1 }

    return materials_count
  end
end
