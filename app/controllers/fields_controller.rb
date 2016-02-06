class FieldsController < ApplicationController
  before_action :set_field, only: [:show, :edit, :update, :destroy]

  # GET /fields
  # GET /fields.json
  def index
    @fields = Field.all
  end

  # GET /fields/1
  # GET /fields/1.json
  def show
  end

  # GET /fields/new
  def new
    @project = current_user.projects.find(params[:project_id])
    @service = @project.services.find(params[:service_id])
    @api = @service.apis.find(params[:api_id])
    @field = @api.fields.new
  end

  # GET /fields/1/edit
  def edit
  end

  # POST /fields
  # POST /fields.json
  def create
    @project = current_user.projects.find(params[:project_id])
    @service = @project.services.find(params[:service_id])
    @api = @service.apis.find(params[:api_id])
    @field = @api.fields.new(field_params)

    respond_to do |format|
      if @field.save
        format.html { redirect_to [@project, @service, @api, @field], notice: 'Field was successfully created.' }
        format.js
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fields/1
  # PATCH/PUT /fields/1.json
  def update
    respond_to do |format|
      if @field.update(field_params)
        format.html { redirect_to project_service_api_field_path(params[:project_id], params[:service_id], params[:api_id], @field.id), notice: 'Field was successfully updated.' }
        format.js
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fields/1
  # DELETE /fields/1.json
  def destroy
    @field.destroy
    respond_to do |format|
      format.html { redirect_to project_service_api_field_path(params[:project_id], params[:service_id], params[:api_id], @field.id), notice: 'Field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field
      @field = Field.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_params
      params.require(:field).permit(:api_id, :name, :field_type, :description)
    end
end
