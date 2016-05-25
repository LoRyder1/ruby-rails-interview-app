class EmployeeProjectsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @users = User.all.paginate(:per_page => 5, :page => params[:page])
    @employee_project = EmployeeProject.new
  end

  def create
    @project = Project.find(params[:project_id])
    @employee_project = EmployeeProject.new(project_id: params[:project_id], user_id: params[:user_id])

    if @employee_project.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @employee_project = EmployeeProject.where(project_id: params[:project_id] ,user_id: params[:id]).last.destroy
    redirect_to project_path(@project)
  end
end
