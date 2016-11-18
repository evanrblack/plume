# This class is for all the public and common pages.
class PagesController < ApplicationController
  def home
  end

  def dashboard
    if current_user.manager?
      manager_dashboard
    elsif current_user.caregiver?
      caregiver_dashboard
    end
  end

  private

  def manager_dashboard
    @group = current_user.group
    @caregivers = current_user.caregivers
    @clients = current_user.clients
    @unarranged_visits = @group.clients.map { |c| c.schedule.visits }.flatten.reject(&:arranged?)
    render 'pages/manager_dashboard'
  end

  def caregiver_dashboard
    render 'pages/caregiver_dashboard'
  end
end
