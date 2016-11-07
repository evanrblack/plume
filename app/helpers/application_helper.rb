# The class all helpers inherit from.
module ApplicationHelper
  def current_user
    current_login.loginable
  end
end
