class ProjectsController < ApplicationController

  def index
    @projects = Project.paginate(page: params[:page])
  end

  def show
    @project = Project.find(params[:id])
    @project_materials = @project.materials

    # put this logic in model
    materials = []
    @project_materials.each do |m|
      materials << [m.name, m.id]
    end
    @materials_count = Hash.new(0)
    materials.each do |key|
      @materials_count[key]+=1
    end
    mat_amount = Hash.new(0)
    mat = Material.all
    mat.each do |x|
      mat_amount.store(x.name, x.amount)
    end
    # raise mat_amount.inspect
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to projects_path
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
