# The class all controllers inherit from.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
