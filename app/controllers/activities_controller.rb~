class ActivitiesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :index]
  before_action :correct_user,   only: :destroy

  def show
    @user = User.find(params[:id])
    @activities = @user.activities.paginate(page: params[:page])
  end
  def index
    	@user = User.find_by_id(current_user[:id])
	if @user.id<=5
		@activity = @user.activities.build 
      		@log_items = @user.log.paginate(page: params[:page])
	else
		redirect_to current_user, :notice => "You dont have the appropriate permission to view that page!"
	end
  end

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
       flash[:success] = "Activity created."
       redirect_to(:back)
    else
       @log_items = []
       #render 'activities/activities'
       render 'new'
    end
  end

  def new
    @user = User.new
    if signed_in?
      @activity = current_user.activities.build 
      @log_items = current_user.log.paginate(page: params[:page])
    else
	redirect_to signin_path, :notice => "Please sign in first"
    end
  end

  def destroy
    @activity.destroy
    redirect_to(:back)
  end

private

  def activity_params
      #params.fetch(:activity, {})
      params.require(:activity).permit(:content) if params[:activity]
  end

  def correct_user
    @activity = current_user.activities.find_by(id: params[:id])
    redirect_to(:back) if @activity.nil?
  end
end
