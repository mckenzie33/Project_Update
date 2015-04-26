class DpmsController < ApplicationController
  before_action :set_dpm, only: [:show, :edit, :update, :destroy, :step1, :step2, :step3, :step4]
  helper DpmsHelper

  # GET /dpms
  # GET /dpms.json
  def index
    @dpm = Dpm.all
  end

  # GET /dpms/1
  # GET /dpms/1.json
  def show
  end

  # GET /dpms/new
  def new
  	@dpm = Dpm.new
  end

  # GET /dpms/1/edit
  def edit
  end

  # POST /dpms
  # POST /dpms.json
  def create
  	@dpm = Dpm.new(dpm_params)
  	#todo @user = User.find_by(current_user[:id])
  	#@user.dpms << @dpm
  	
    respond_to do |format|
      if @dpm.save
        format.html { render '/dpms/step1', notice: 'Dpm was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dpm }
      else
        format.html { render action: 'new' }
        format.json { render json: @dpm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dpms/1
  # PATCH/PUT /dpms/1.json
  def update
    respond_to do |format|
      if @dpm.update(dpm_params)  
        format.html { redirect_to @dpm, notice: 'Dpm was successfully updated.' }
        format.json { head :no_content }  
      else
        format.html { render action: 'edit' }
        format.json { render json: @dpm.errors, status: :unprocessable_entity }
      end
    end
  end

  def step1
    respond_to do |format|
      if @dpm.update(dpm_params)
        format.html { render '/dpms/step2', notice: 'Change this to something else'}
        format.json { head :no_content }
      else
        format.html { render '/dpms/step1', notice: 'Step not saved, please retry'}
        format.html { render json: @dpm.errors, status: :unprocessable_entity}
      end
    end
  end

  def step2
    respond_to do |format|
      if @dpm.update(dpm_params)
        format.html { render '/dpms/step3', notice: 'Change me'}
        format.json { head :no_content }
      else
        format.html { render '/dpms/step2', notice: 'Step not saved, please retry'}
        format.html { render json: @dpm.errors, status: :unprocessable_entity}
      end
    end
  end

  def step3
    respond_to do |format|
      if @dpm.update(dpm_params)
        format.html { render '/dpms/step4', notice: 'Change me'}
        format.json { head :no_content }
      else
        format.html { render '/dpms/step3', notice: 'Step not saved, please retry'}
        format.html { render json: @dpm.errors, status: :unprocessable_entity}
      end
    end
  end

  def step4
    respond_to do |format|
      if @dpm.update(dpm_params)
        format.html { render '/dpms/step5', notice: 'Change me'}
        format.json { head :no_content }
      else
        format.html { render '/dpms/step4', notice: 'Step not saved, please retry'}
        format.html { render json: @dpm.errors, status: :unprocessable_entity}
      end
    end
  end


  # DELETE /dpms/1
  # DELETE /dpms/1.json
  def destroy
    @dpm.destroy
    respond_to do |format|
      format.html { redirect_to dpms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dpm
      @dpm = Dpm.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def dpm_params
      params.require(:dpm).permit(:filename, :graph_number, :youngs_modulus, :gauge_length, :necking_point, :fitting_param, :threshold)     end
  end
