# This controller handles all requests for caregiver resources.
class CaregiversController < ApplicationController
  load_and_authorize_resource

  before_action :setup
  before_action :setup_tags, only: [:new, :create, :edit, :update]
  before_action :setup_breadcrumbs

  def index
    @caregivers = current_user.caregivers
  end

  def new
    @caregiver = Caregiver.new
  end

  def create
  end

  def show
    @categories_tags = @caregiver.tags.sort_by(&:name).group_by(&:category)
  end

  def edit
  end

  def update
    if @caregiver.update(caregiver_params)
      flash[:success] = "Successfully updated #{@caregiver.name}'s profile."
      redirect_to @caregiver
    else
      render :edit
    end
  end

  def destroy
    @caregiver.destroy
    flash[:success] = "Successfully deleted #{@caregiver.name}'s profile"
    redirect_to caregivers_path
  end

  private

  def setup
    return if params[:id].blank?
    @caregiver = Caregiver.find(params[:id])
  end

  def setup_tags
    @health_tags = Tag.health.sort_by(&:name)
    @environment_tags = Tag.environment.sort_by(&:name)
    @task_tags = Tag.task.sort_by(&:name)
  end

  def setup_breadcrumbs
    index = [['Caregivers', caregivers_path]]
    @breadcrumbs = case action_name
                   when /index/ then index
                   when /new|create/ then index << ['New', new_caregiver_path]
                   when /show/ then index << [@caregiver.name, @caregiver]
                   when /edit|update/
                     index << [@caregiver.name, @caregiver] <<
                     ['Edit', edit_caregiver_path(@caregiver)]
                   end
  end

  def caregiver_params
    params.require(:caregiver)
          .permit(:first_name, :last_name, :gender, :birthdate, :phone_number,
                  :street_address, :extra_address, :city, :state, :zip_code,
                  tag_ids: [],
                  schedule_attributes: [:id, :week_b])
  end
end
