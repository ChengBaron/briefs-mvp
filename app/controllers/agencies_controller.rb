class AgenciesController < ApplicationController

  before_action :set_agency, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def home
  end

  def index         # GET /agencies
    # @agencies = Agency.all
    @agencies = policy_scope(Agency)
  end

  def show          # GET /agencies/:id
    @agency = Agency.find(params[:id])
  end

  def new           # GET /agencies/new
    @agency = Agency.new(params[:id])
    authorize @agency
  end

  def create        # POST /agencies
    @agency = Agency.new(agency_params.merge(user_id: current_user.id))
    # @agency.user = current_user
    authorize @agency
    @agency.save!
    # no need for app/views/agencies/create.html.erb
    redirect_to agency_path(@agency)
  end

  def edit          # GET /agencies/:id/edit
    @agency = Agency.find(params[:id])
  end

  def update        # PATCH /agencies/:id
    @agency = Agency.find(params[:id])
    @agency.update(agency_params)
    # no need for app/views/agencies/update.html.erb
    redirect_to agency_path(@agency)
  end

  def destroy       # DELETE /agencies/:id
    @agency = Agency.find(params[:id])
    @agency.destroy
    # no need for app/views/agencies/destroy.html.erb
    redirect_to agencies_path
  end

  private

  def set_agency
    @agency = Agency.find(params[:id])
    authorize @agency
  end

  def agency_params
    # *Strong params*: *whitelist* what can be updated by the user
    params.require(:agency).permit(:name, :address, :description)
  end

end
