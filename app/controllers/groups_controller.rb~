class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :check_access, only: [:index, :edit, :update, :create, :new, :destroy]
  before_action :for_show, only: [:show]

  # GET /groups
  # GET /groups.json
  def index
    if is_admin?
    	@groups = Group.all
    else
	@groups = Group.where(:owner_name => current_user.name)
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
	@testfiles = Testfile.where(:groupname => @group.groupname)
	
	@mats = MatMembership.where(:group_name => @group.groupname).pluck(:mat_name)
	@materials = Material.where(:mat_name => @mats)
	
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end
  

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end	
    @membership = Membership.new(:user_id=>current_user.id, :group_id=>@group.id, :owner=>true, :is_confirmed=>true)
    @membership.save
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:groupname, :description, :owner_email, :owner_id, :is_public, :owner_name)
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

    def for_show
	@user_memberships = Membership.where(:group_id => @group.id, :user_id => current_user.id, :is_confirmed => true)
	if (@user_memberships.count == 0) and not (is_admin? or is_group_admin?)
		redirect_to(current_user, :notice => "You have to be a member of that group!")
	end
    end
end
