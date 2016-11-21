# This controller handles all requests for visit resources.
class VisitsController < ApplicationController
  load_and_authorize_resource

  before_action :setup_breadcrumbs

  respond_to :html, :json

  def index
    if params[:client_id] && params[:start_time_planned] && params[:end_time_planned]
      @client = Client.find(params[:client_id])
      @visit = @client.schedule.visits.select do |visit|
        visit.start_time_planned == params[:start_time_planned] && visit.end_time_planned == params[:end_time_planned]
      end.first
      @matches = @visit.matches.map do |match|
        { id: match[:caregiver].id,
          name: match[:caregiver].name,
          distance: (match[:distance_info]).ceil,
          tag_score: (match[:tag_score] * 100).round,
          missing_tags: match[:tag_info].map(&:name),
          score: (match[:total_score] * 100).round }
      end
      respond_with(@matches)
    elsif params[:client_id]
      @client = Client.find(params[:client_id])
      @visits = @client.schedule.visits.map do |visit|
        { id: visit.id,
          client_id: visit.client.id,
          unfilled: !visit.filled?,
          start_time_planned: visit.start_time_planned.to_s,
          end_time_planned: visit.end_time_planned.to_s,
          text: helpers.pretty_shift(visit.start_time_planned..visit.end_time_planned) }
      end
      respond_with(@visits)
    else
      @clients = current_user.group.clients.map do |client|
        { id: client.id, name: client.name, 
          unfilled: client.schedule.visits.reject(&:filled?).length }
      end
      respond_with(@clients)
    end
  end

  def create
    @visit = Visit.create(visit_params_manager)
    respond_with(@visit)
  end

  def update
    @visit = Visit.find_by(params[:id])
    if current_user.manager?
      @visit.update(visit_params_manager)
    else
      @visit.update(visit_params_caregiver)
    end
    respond_with(@visit)
  end

  private

  def setup_breadcrumbs
    index = [['Visits', visits_path]]
    @breadcrumbs = case action_name
                   when /index/ then index
                   end
  end

  def visit_params_manager
    params.permit(:start_time_planned, :end_time_planned, :client_id, :caregiver_id)
  end

  def visit_params_caregiver
    params.permit(:latitude, :longitude)
  end
end
