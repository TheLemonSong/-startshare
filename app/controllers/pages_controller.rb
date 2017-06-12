class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    # Create an array of all the current user's projects, where the user is of the project
    # matchesthe current_user.
    @projects = Project.where(user_id: current_user)
    @applications = current_user.applications


    # Create an array to store the user applications for a role.
    user_applications = []
    # For each of the current user's projects, where the role id (owner) matches the current user,
    # go through each role in each project and push applications found for each role
    #
    # For each role in each current user project found, find the applications which have the same
    # role_id as the role.id in the current user's project being looked at.
    # Essentially the 3 lines of code below produce an array of arrays of roles, that are grouped
    # by project (e.g. [[role1-application_1, role1-application_2], [role2-application_1, role2-application_2], [...], ])
    @projects.each do |project|
      project.roles.each do |role|
        user_applications << Application.where(role_id: role.id)
      end
    end
    # The following line strips the array or arrays into one big array, e.g.
    #[role1-application_1, role1-application_2, role2-application_1, role2-application_2, ....]
    @user_applications = user_applications.flatten


  end

  def message

  end
end
