class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]
#before_action :check_access, only: [:edit, :update, :create, :new, :destroy]

  # GET /materials
  # GET /materials.json
  def index
    @filterrific = Filterrific.new(Material, params[:filterrific] || session[:filterrific_materials])
    @materials = Material.filterrific_find(@filterrific).page(params[:page])
    session[:filterrific_materials] = @filterrific.to_hash

    respond_to do |format|
	  format.html
	  format.js
	  format.csv { render text: @materials.to_csv }
	  format.xls # { send_data @materials.to_csv(col_sep: "\t") }
    end
  end
  
  def reset_filterrific
    session[:filterrific_materials] = nil
    redirect_to :action => :index
  end

  # GET /materials/1
  # GET /materials/1.json
  def show
	  @testfiles = @material.testfiles
  end

  # GET /materials/new
  def new
    @material = Material.new
  end

  # GET /materials/1/edit
  def edit
  end

  # POST /materials
  # POST /materials.json
  def create
    @material = Material.new(material_params)
    property = @material.build_property(:material_id => @material.id)
    @user = User.find_by_id(current_user[:id])
    @user.materials << @material
    #testfiles = @material.testfiles.build(:material_id => @material.id)

    respond_to do |format|
      if @material.save
        format.html { redirect_to @material, notice: 'Material was successfully created.' }
        format.json { render action: 'show', status: :created, location: @material }
      else
        format.html { render action: 'new' }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to @material, notice: 'Material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material.destroy

    #find(:all, :conditions => ["name LIKE ? AND active = ?", "%#{search}%", 1])
   respond_to do |format|
      format.html { redirect_to materials_url }
      format.json { head :no_content }
    end
  end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_params
      params.require(:material).permit(:mat_name, :mat_type, :testfiles, :description, :user_id)
    end

    def check_access
	if not (is_admin?)
		if signed_in?
			redirect_to(current_user, :notice => "You tried to access a wrong link, please try again!")
		else
			redirect_to(root, :notice => "You tried to access a wrong link, please try again!")
		end
	end
    end
end
