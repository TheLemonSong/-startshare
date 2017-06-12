class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]


  def show
  end

  def new
    @role = Role.new
    authorize @role
    @project = Project.find(params[:project_id])

  end

  def create
    @role = Role.new(role_params)
    @project = Project.find(params[:project_id])
    @role.project = @project

    skills = params[:role][:skill_ids].reject { |c| c.blank? }
    skills.each do |id|
      s = Skill.find(id.to_i)
      RoleSkill.create(role: @role, skill: s)
    end
    authorize @role

    if @role.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit

    @project = Project.find(params[:project_id])
  end

  def update
    @project = Project.find(params[:project_id])

    skills = params[:role][:skill_ids].reject { |c| c.blank? }
    @role.skills.destroy_all
    skills.each do |id|
      s = Skill.find(id.to_i)
      RoleSkill.create(role: @role, skill: s)
    end

    if @role.update(role_params)
      # raise
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @role.destroy
    redirect_to project_path(@project)
  end

  private

  def role_params
    params.require(:role).permit(:name, :description, :icon, :skills)
  end

  def set_role
    @role = Role.find(params[:id])
    authorize @role
  end

end
