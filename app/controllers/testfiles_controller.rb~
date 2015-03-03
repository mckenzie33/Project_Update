class TestfilesController < ApplicationController
  before_action :set_testfile, only: [:show, :edit, :update, :download, :destroy]
  before_action :check_access, only: [:index, :edit, :update, :destroy, :new, :create]

  # GET /testfiles
  # GET /testfiles.json
  def index
    @testfiles = Testfile.all
  end
    
  # GET /testfiles/1
  def download
   @file = Testfile.find(params[:id])
   send_file(@file.filename.path,
              :disposition => 'attachment',
              :url_based_filename => false)
        
  end

  # GET /testfiles/1
  # GET /testfiles/1.json
  def show
  end

  # GET /testfiles/new
  def new
    @testfile = Testfile.new
  end

  # GET /testfiles/1/edit
  def edit
  end

  # POST /testfiles
  # POST /testfiles.json
  def create
    @testfile = Testfile.new(testfile_params)

    respond_to do |format|
      if @testfile.save
        format.html { redirect_to @testfile, notice: 'Testfile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @testfile }
      else
        format.html { render action: 'new' }
        format.json { render json: @testfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testfiles/1
  # PATCH/PUT /testfiles/1.json
  def update
    respond_to do |format|
      if @testfile.update(testfile_params)
        format.html { redirect_to @testfile, notice: 'Testfile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @testfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testfiles/1
  # DELETE /testfiles/1.json
  def destroy
    @testfile.destroy
    respond_to do |format|
      format.html { redirect_to testfiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testfile
      @testfile = Testfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testfile_params
      params.require(:testfile).permit(:filename, :uploaded_by, :material_id, :mat_name, :mat_type, :group_id, :groupname, :group_owner_id, :comments, :confidence_level, :person_in_charge, :test_location, :test_date)
    end

    def check_access
	if not (is_admin? or is_group_admin?)
		if signed_in?
			redirect_to(current_user, :notice => "You tried to access a wrong link, please try again!")
		else
			redirect_to(root, :notice => "You tried to access a wrong link, please try again!")
		end
	end
    end
end
