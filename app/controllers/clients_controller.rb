# This controller handles all requests for client resources.
class ClientsController < ApplicationController
  load_and_authorize_resource

  before_action :setup
  before_action :setup_tags, only: [:new, :create, :edit, :update]
  before_action :setup_breadcrumbs

  def index
    @clients = current_user.clients
  end

  def new
    @client = Client.new
    @client.group = current_user.group
  end

  def create
    @client = Client.new(client_params)
    @client.group = current_user.group

    if @client.save
      flash[:success] = "Successfully added #{@client.name} as client."
      redirect_to @client
    else
      render :new
    end
  end

  def show
    @categories_tags = @client.tags.sort_by(&:name).group_by(&:category)
    @visits = @client.schedule.visits
  end

  def edit
  end

  def update
    if @client.update(client_params)
      flash[:success] = "Successfully updated #{@client.name}'s profile."
      redirect_to @client
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    flash[:success] = "Successfully deleted #{@client.name}'s profile"
    redirect_to clients_path
  end

  private

  def setup
    return if params[:id].blank?
    @client = Client.find(params[:id])
    @tasks = @client.tasks.active
  end

  def setup_tags
    @health_tags = Tag.health.sort_by(&:name)
    @environment_tags = Tag.environment.sort_by(&:name)
    @task_tags = Tag.task.sort_by(&:name)
  end

  def setup_breadcrumbs
    index = [['Clients', clients_path]]
    @breadcrumbs = case action_name
                   when /index/ then index
                   when /new|create/ then index << ['New', new_client_path]
                   when /show/ then index << [@client.name, @client]
                   when /edit|update/
                     index << [@client.name, @client] <<
                     ['Edit', edit_client_path(@client)]
                   end
  end

  def client_params
    params.require(:client)
          .permit(:first_name, :last_name, :gender, :birthdate, :phone_number,
                  :street_address, :extra_address, :city, :state, :zip_code,
                  :description,
                  tag_ids: [],
                  tasks_attributes: [:id, :description, :_remove],
                  schedule_attributes: [:id, :week_b])
  end
end
