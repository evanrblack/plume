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
    @unfilled_visits = @group.clients.map { |c| c.schedule.visits }
                             .flatten.reject(&:filled?)

    # Charts
    @revenue_split = { 'Organization' => 11_664, 'Caregiver' => 14_256 }
    @client_count = {
      'February 2017' => 0,
      'March 2017' => 5,
      'April 2017' => 10,
      'May 2017' => 20
    }
    @client_tags = @clients.map(&:tags).flatten.group_by(&:name)
                           .map { |name, tags| [name, tags.length] }
                           .sort_by(&:second).last(10)
    @caregiver_tags = @caregivers.map(&:tags).flatten.group_by(&:name)
                                 .map { |name, tags| [name, tags.length] }
                                 .sort_by(&:second).last(10)
    render 'pages/manager_dashboard'
  end

  def caregiver_dashboard
    render 'pages/caregiver_dashboard'
  end
end
