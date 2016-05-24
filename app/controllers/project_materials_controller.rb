class ProjectMaterialsController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @materials = Material.all
    @project_material = ProjectMaterial.new
  end

  def create
    @project = Project.find(params[:project_id])
    @project_material = ProjectMaterial.new(project_id: params[:project_id], material_id: params[:material_id])

    if @project_material.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @project_material = ProjectMaterial.where(project_id: params[:project_id] ,material_id: params[:id]).last.destroy
    redirect_to project_path(@project)
  end
end
