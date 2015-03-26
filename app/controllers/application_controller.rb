class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Needed to include all the pundit helpers (authorization)
  include Pundit

  # Globally rescue Authorization Errors in controller.
  # Returning 403 Forbidden if permission is denied
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  private

  def permission_denied
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end

  # Devise-handled
  def after_sign_in_path_for(resource)
    dashboard_path
  end

  # Devise-handled
  def after_sign_out_path_for(resource)
    root_path
  end
end
