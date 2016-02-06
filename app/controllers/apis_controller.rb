class ApisController < ApplicationController
  before_action :set_api, only: [:show, :edit, :update, :destroy]

  # GET /apis
  # GET /apis.json
  def index
    @apis = Api.all
  end

  # GET /apis/1
  # GET /apis/1.json
  def show
  end

  # GET /apis/new
  def new
    @project = current_user.projects.find(params[:project_id])
    @service = @project.services.find(params[:service_id])
    @api = @service.apis.new
  end

  # GET /apis/1/edit
  def edit
    @project = current_user.projects.find(params[:project_id])
    @service = @project.services.find(params[:service_id])
  end

  # POST /apis
  # POST /apis.json
  def create
    @project = current_user.projects.find(params[:project_id])
    @service = @project.services.find(params[:service_id])
    @api = @service.apis.new(api_params)

    respond_to do |format|
      if @api.save
        format.html { redirect_to [@project, @service, @api], notice: 'Api was successfully created.' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.js
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apis/1
  # PATCH/PUT /apis/1.json
  def update
    respond_to do |format|
      if @api.update(api_params)
        format.html { redirect_to [@api.project, @api.service, @api], notice: 'Api was successfully updated.' }
        format.js
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apis/1
  # DELETE /apis/1.json
  def destroy
    @api.destroy
    respond_to do |format|
      format.html { redirect_to apis_url, notice: 'Api was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api
      @api = Api.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_params
      params.require(:api).permit(:service_id, :name, :request_type, :path, :description, :status)
    end
end
