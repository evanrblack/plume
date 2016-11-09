# This controller handles all requests for client resources.
class ClientsController < ApplicationController
  load_and_authorize_resource

  def index
    @clients = current_user.clients
    @breadcrumbs = [['Clients', clients_path]]
  end

  def new
  end

  def create
  end

  def show
    @client = Client.find(params[:id])
    @breadcrumbs = [['Clients', clients_path], [@client.name, @client]]
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
