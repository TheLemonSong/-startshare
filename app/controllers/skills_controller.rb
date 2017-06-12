class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @skills = Skill.all
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      redirect_to skill_path(@skill)
    else
      render :new
    end
  end

  def new
    @skill = Skill.new
  end

  def update
  end

  def destroy
    @skill.destroy
    redirect_to skills_path
  end

  def edit
  end


private

  def set_skill
      @skill = Skill.find(params[:id])
  end

  def role_params
    params.require(:skill).permit(:type, :icon)
  end

















end
