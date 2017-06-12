class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @projects = Project.where(user_id: current_user)
    @applications = current_user.applications
  end

  def message

  end
end
