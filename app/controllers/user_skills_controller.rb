class UserSkillsController < ApplicationController
  before_action :set_user_skill, only: [:show, :edit, :update, :destroy, :create]



  def update
  end

  def edit
    authorize @user_skill
  end


private

  def set_user_skill
      @user_skill = UserSkill.find(params[:id])
      authorize @user_skill
  end

  def role_params
    params.require(:user_skill).permit(:type, :icon)
  end


end
