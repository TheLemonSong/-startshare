class UserSkillsController < ApplicationController
  before_action :set_user_skill, only: [:show, :edit, :update, :destroy]

  # def update
  #   user_skills = params[:user][:skill_ids].reject { |c| c.blank? }
  #   current_user.skills.destroy_all
  #   user_skills.each do |id|
  #     s = UserSkill.find(id.to_i)
  #     UserSkill.create(user: current_user, skill: s)
  #   end

  #   if @user.update(user_params)
  #     # raise
  #     redirect_to user_path(@user)
  #   else
  #     render :edit
  #   end
  # end
  def update
      @user_skill = UserSkill.find(params[:id])
      @user_skill.update(user_skill_params)
      authorize @user_skill
      redirect_to user_path(current_user)
  end

  def destroy
    @user_skill = UserSkill.find(params[:id])
    @user_skill.destroy
    authorize @user_skill
    redirect_to user_path(current_user)

  end

  def edit
  end

  def new
    @user_skill = UserSkill.new
    authorize @user_skill
  end

  def create
    @user_skill = UserSkill.new(user_skill_params)
    @user_skill.user = current_user
    authorize @user_skill
    if @user_skill.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def set_user_skill
    @user_skill = UserSkill.find(params[:id])
    authorize @user_skill
  end

  def user_skill_params
    params.require(:user_skill).permit(:years, :description, :skill_id)
  end
end
