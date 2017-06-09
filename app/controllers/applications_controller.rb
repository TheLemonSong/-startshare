class ApplicationsController < ApplicationController

  before_action :set_application, only: [:show]
  before_action :set_role, only: [:create]


  def show
  end

  def new
    @application = Application.new

  end

  def create
    @application = Application.new(params[:cover_message])
    @application.user = current_user
    @application.role = @role
    authorize @application
    if @application.save
      redirect_to dashboard_path
    else
      render 'projects/show'
    end
  end

  private

  def set_application
      @application = Application.find(params[:id])
  end

  def set_role
    @role = Role.find(params[:role_id])
  end
end


