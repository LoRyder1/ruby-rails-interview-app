class ProjectsController < ApplicationController

  def index
    @projects = Project.paginate(page: params[:page])
  end

  def show
    @project = Project.find(params[:id])
    @project_materials = @project.materials
    
    @materials_count = @project.get_material_count
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project
      head :no_content
    else
      render json: @project.errors, status: :unprocessable_entity
      head :no_content
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    head :no_content
  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
