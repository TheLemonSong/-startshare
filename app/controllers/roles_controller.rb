class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]


  def show
  end

  def new
    @role = Role.new
    @project = Project.find(params[:project_id])
    authorize @role

  end

  def create
    @role = Role.new(role_params)
    @project = Project.find(params[:project_id])
    @role.project = @project
    # @role.user = current_user
    if @role.save
      redirect_to project_path(@project)
    else
      render :new
    end
    authorize @role
  end

  def edit

  end

  def update
    @role.update(role_params)
    redirect_to role_path(@role)
  end

  def destroy
    @role.destroy
    redirect_to root_path
  end


private

  def role_params
    params.require(:role).permit(:name, :description, :icon)
  end

  def set_role
      @role = Role.find(params[:id])
  end

end
