class ApplicationsController < ApplicationController

  before_action :set_application, only: [:show, :accept_application, :decline_application]
  before_action :set_role, only: [:create]


  def show
  end

  def new
    @application = Application.new

  end

  def create
    @application = Application.new(cover_message: params[:application][:cover_message])
    # raise
    @application.user = current_user
    @application.role = @role
    authorize @application

    if @application.save
      conversation = Conversation.create(sender: @application.user, recipient: @application.role.project.user, application: @application)
      Message.create(conversation: conversation, body: @application.cover_message, user: @application.user)
      redirect_to dashboard_path
    else
      render 'projects/show'
    end
  end

  def accept_application

    @application.status = "accepted"
        authorize @application

    @application.save
    redirect_to dashboard_path
  end

  def decline_application
    @application.status = "declined"
        authorize @application

    @application.save
    redirect_to dashboard_path
  end

  private

  def set_application
      @application = Application.find(params[:id])
  end

  def set_role
    @role = Role.find(params[:role_id])
  end
end


