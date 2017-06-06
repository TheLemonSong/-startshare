class ApplicationsController < ApplicationController

before_action :set_application, only: [:show]


  def show
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    # @role.user = current_user
    if @application.save
      redirect_to application_path(@application)
    else
      render :new
    end
  end

  private

  def application_params
    params.require(:application).permit(:status)
  end

  def set_application
      @application = Application.find(params[:id])
  end
end


