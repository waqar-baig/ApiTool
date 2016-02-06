class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    @services = if params[:project_id].present?
        Service.joins(project: :user).where(project_id: params[:project_id], 'projects.user_id'=> current_user.id)
      else
        Service.all
      end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    respond_to do |format|
      format.js { render :action => "show" }
      format.html
    end
  end

  # GET /services/new
  def new
    project = Project.find(params[:project_id])
    @service = project.services.build
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to [@service.project, @service], notice: 'Service was successfully created.' }
        format.js
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to [@service.project, @service], notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to all_services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:project_id, :name, :description, :status)
    end
end
