class MeasureNamesController < ApplicationController
  before_action :set_measure_name, only: [:show, :edit, :update, :destroy]

  # GET /measure_names
  # GET /measure_names.json
  def index
    @measure_names = MeasureName.all.order('name ASC')
  end

  # GET /measure_names/1
  # GET /measure_names/1.json
  def show
  end

  # GET /measure_names/new
  def new
    @measure_name = MeasureName.new
    @measure_units = MeasureUnit.all.order('name ASC')
  end

  # GET /measure_names/1/edit
  def edit
    @measure_units = MeasureUnit.all.order('name ASC')
  end

  # POST /measure_names
  # POST /measure_names.json
  def create
    @measure_name = MeasureName.new(measure_name_params)
    @measure_units = MeasureUnit.all.order('name ASC')

    respond_to do |format|
      if @measure_name.save
        format.html { redirect_to @measure_name, notice: 'Measure name was successfully created.' }
        format.json { render :show, status: :created, location: @measure_name }
      else
        format.html { render :new }
        format.json { render json: @measure_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measure_names/1
  # PATCH/PUT /measure_names/1.json
  def update
    respond_to do |format|
      if @measure_name.update(measure_name_params)
        format.html { redirect_to @measure_name, notice: 'Measure name was successfully updated.' }
        format.json { render :show, status: :ok, location: @measure_name }
      else
        format.html { render :edit }
        format.json { render json: @measure_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measure_names/1
  # DELETE /measure_names/1.json
  def destroy
    @measure_name.destroy
    respond_to do |format|
      format.html { redirect_to measure_names_url, notice: 'Measure name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measure_name
      @measure_name = MeasureName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measure_name_params
      params.require(:measure_name).permit(:name, :measure_unit_id)
    end
end
