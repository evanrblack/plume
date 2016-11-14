# This controller handles all requests for caregiver resources.
class CaregiversController < ApplicationController
  load_and_authorize_resource

  def index
    @caregivers = current_user.caregivers
    @breadcrumbs = [['Caregivers', caregivers_path]]
  end

  def new
    @caregiver = Caregiver.new
  end

  def create
  end

  def show
    @caregiver = Caregiver.find(params[:id])
    @breadcrumbs = [['Caregivers', caregivers_path],
                    [@caregiver.name, @caregiver]]
    @categories_tags = @caregiver.tags.group_by(&:category)
  end

  def edit
    @caregiver = Caregiver.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
