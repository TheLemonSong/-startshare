class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]


  def show
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    # @role.user = current_user
    if @role.save
      redirect_to role_path(@role)
    else
      render :new
    end
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
    params.require(:role).permit(:name, :description)
  end

  def set_role
      @role = Role.find(params[:id])
  end

end
