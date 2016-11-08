# The class all controllers inherit from.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    current_login.loginable if current_login
  end
end
