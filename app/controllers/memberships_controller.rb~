class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]
  before_action :check_access, only: [:index, :show, :edit, :update, :create, :new]
  
  # GET /memberships
  # GET /memberships.json
  def index
    if is_admin?
    	@memberships = Membership.all
    else
	@admingroups = Group.where(:owner_id => current_user.id)
	@memberships = Membership.where(:group_id => @admingroups)
    end
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
    @memberships = Membership.find(params[:id])
  end

  # GET /memberships/new
  def new
    @membership = Membership.new
  end

  # GET /memberships/1/edit
  def edit
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @membership = Membership.new(membership_params)

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership, notice: 'Membership was successfully created.' }
        format.json { render action: 'show', status: :created, location: @membership }
      else
        format.html { render action: 'new' }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: 'Membership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership.destroy
    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:user_id, :group_id, :owner, :is_confirmed, :comments)
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
