# This class is for all the public and common pages.
class PagesController < ApplicationController
  def home
    flash.now[:success] = 'Woah!'
  end
end
