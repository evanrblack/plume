# This class is for all the public and common pages.
class PagesController < ApplicationController
  def home
  end

  def dashboard
    @group = current_user.group
  end
end
