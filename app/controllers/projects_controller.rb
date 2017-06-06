class ProjectsController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @service.update(service_params)
    redirect_to service_path(@service)
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :summary, :details, :start_date, :stage)
  end

  def set_project
      @project = Project.find(params[:id])
  end
end
