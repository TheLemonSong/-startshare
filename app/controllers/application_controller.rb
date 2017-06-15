class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # fixes the better errors bug
  before_action :better_errors_hack, if: -> { Rails.env.development? }

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Needed for OpenGraph stuff
  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  def better_errors_hack
    request.env['puma.config'].options.user_options.delete :app
  end

  def configure_permitted_parameters
  # For additional fields in app/views/devise/registrations/new.html.erb
  # devise_parameter_sanitizer.permit code is required to validate anything beyond email & password when using devise
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :city, :zip, :education, :country, :address, :address_line_2, :state, :profile_photo])

  # For additional in app/views/devise/registrations/edit.html.erb
  devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  private

  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end

  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
