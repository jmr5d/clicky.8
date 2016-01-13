class MeasurementsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:list, :show, :new, :edit, :create, :update, :destroy]

  before_action :set_measurement, only: [:show, :edit, :update, :destroy]
  before_action :find_measure_name_id
  before_action :find_measure_unit_id

  def list
    @measurements = Measurement.all.order('happened_at DESC')
    @measure_names = MeasureName.all.order('name ASC')
    @user = current_user
    @measurements_by_user = Measurement.order('happened_at DESC').where(:user_id => current_user.id)
  end
  
  # GET /measurements
  # GET /measurements.json
  def index
    @measurements = Measurement.all.order('happened_at DESC')
    @measure_names = MeasureName.all.order('name ASC')
  end

  # GET /measurements/1
  # GET /measurements/1.json
  def show
  end

  # GET /measurements/new
  def new
    @measurement = Measurement.new
    @measure_names = MeasureName.all.order('name ASC')
    @measure_units = MeasureUnit.all.order('name ASC')
  end

  # GET /measurements/1/edit
  def edit
    @measure_names = MeasureName.all
    @measure_units = MeasureUnit.all
  end

  # POST /measurements
  # POST /measurements.json
  def create
    @measurement = Measurement.new(measurement_params)
    @measurement.user = current_user

    respond_to do |format|
      if @measurement.save
        format.html { redirect_to @measurement, notice: 'Measurement was successfully created.' }
        format.json { render :show, status: :created, location: @measurement }
      else
        format.html { render :new }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurements/1
  # PATCH/PUT /measurements/1.json
  def update
    respond_to do |format|
      if @measurement.update(measurement_params)
        format.html { redirect_to @measurement, notice: 'Measurement was successfully updated.' }
        format.json { render :show, status: :ok, location: @measurement }
      else
        format.html { render :edit }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurements/1
  # DELETE /measurements/1.json
  def destroy
    @measurement.destroy
    respond_to do |format|
      format.html { redirect_to measurements_url, notice: 'Measurement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      if params[:id]
        @measurement = Measurement.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measurement_params
      params.require(:measurement).permit(:altitude, :latitude, :longitude, :happened_at, :user_id, :measure_name_id,
        :measure_unit_id, :value, :notes, :tag_list)
    end

    def find_measure_name_id
      if params[:measure_name_id]
        @measure_name_name = MeasureName.find(params[:measure_name_id]).name
        @measure_name_id = MeasureName.find(params[:measure_name_id]).id
      end
    end

    def find_measure_unit_id
      if params[:measure_unit_id]
        @measure_unit_name = MeasureUnit.find(params[:measure_unit_id]).name
        @measure_unit_id = MeasureUnit.find(params[:measure_unit_id]).id
      end
    end
end
