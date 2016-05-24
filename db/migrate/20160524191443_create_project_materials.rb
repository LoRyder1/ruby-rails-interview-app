class CreateProjectMaterials < ActiveRecord::Migration
  def change
    create_table :project_materials do |t|
      t.references :project, index: true, foreign_key: true
      t.references :material, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
