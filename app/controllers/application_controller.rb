# The class all controllers inherit from.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Handles redirection when not authorized
  rescue_from CanCan::AccessDenied do |exception|
    #store_location_for(:login, request.path)
    flash[:danger] = exception.message
    redirect_to new_login_session_path
  end

  # Redirect to attempted page or root path if there wasn't one
  #def after_sign_in_path_for(_resource)
  #  session[:login_return_to] || root_path
  #end

  def current_user
    current_login.loginable if current_login
  end
end
