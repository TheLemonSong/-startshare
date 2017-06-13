
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.save
    redirect_to user_path(@user)
  else
    render :new
  end
end

def edit

end


def update
  skills = params[:user][:skill_ids].reject { |c| c.blank? }
  current_user.skills.destroy_all
  skills.each do |id|
    s = Skill.find(id.to_i)
    UserSkill.create(user: current_user, skill: s)
  end

  if @user.update(user_params)
    # raise
    redirect_to user_path(@user)
  else
    render :edit
  end
end

def show
  @skills = current_user.skills
end

def destroy
  @user.destroy
  redirect_to users_path
end

private

def set_user
  @user=User.find(params[:id])
  authorize @user
end

def user_params

  params.require(:user).permit(:first_name, :last_name, :email, :city, :zip, :country, :education, :profile_photo, :skill_ids)
end

end

