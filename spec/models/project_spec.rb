describe Project do 
  context "getting material count" do
    it "retrieves material count for project" do
      proj = Project.create(name: 'Home', description: 'big phat house')
      mat = Material.create(name: 'Brick', amount: '2')
      5.times do
        ProjectMaterial.create(project_id: proj.id, material_id: mat.id)
      end
      expect(proj.get_material_count).to eq({["Brick", "2", 1]=>5})
    end
  end
end

