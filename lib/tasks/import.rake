require 'csv'

namespace :import do

  desc "Import employee projects from csv"
  task employee_projects: :environment do
    filename = File.join Rails.root, "Employees_projects.csv"
    counter, not_found = 0, 0

    CSV.foreach(filename, headers: true) do |row|

      user_name, proj_name = row["Employee"], row["Project"]
      user = User.find_by(name: user_name)
      project = Project.find_by(name: proj_name)

      if user == nil or project == nil
        puts "Could not find User: #{user_name} or Project: #{proj_name}"
        not_found += 1
        next
      end

      emp = EmployeeProject.create(user_id: user.id, project_id: project.id)
      counter += 1 if emp.persisted?
    end

    total = counter + not_found
    puts "Imported #{counter} out of #{total} employee projects"
  end

  desc "Import project materials from csv"
  task project_materials: :environment do
    filename = File.join Rails.root, "materials.csv"
    counter, not_found = 0,0

    CSV.foreach(filename, headers: true) do |row|

      project, material, amount = row["Project"], row["Material"], row["Amount"]
      proj = Project.find_by(name: project)
      mat = Material.find_or_create_by(name: material, amount: amount)

      if proj == nil
        puts "Could not find Project: #{project}"
        not_found +=1
        next
      end

      projmat = ProjectMaterial.create(project_id: proj.id, material_id: mat.id)
      counter += 1 if projmat.persisted?
    end

    total = counter + not_found
    puts "Imported #{counter} out of #{total} project materials"
  end
end

