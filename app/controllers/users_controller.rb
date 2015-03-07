class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :show, :index]
  before_action :correct_user, only: [:edit, :update, :show]
  def show
     @user = User.find(params[:id])
  end

  def new
    if signed_in?
	redirect_to current_user
    else
     @user = User.new
    end
  end

  def edit
  end

  def index
	@user = User.find_by_id(current_user[:id])
	if @user.id<=5
		@users = User.all
	else
		redirect_to current_user, :notice => "You dont have the appropriate permission to view that page!"
	end
  end

  def update
    if @user.update_attributes(user_params)
       flash[:success] = "Profile updated"
       redirect_to @user
    else 
       render 'edit', :notice => "Error updating profile try again!"
    end
  end

  def create
     @user = User.new(user_params)
       if @user.save
          sign_in @user
          flash[:success] = "Welcome #{@user.name}"
           redirect_to @user
       else 
          render 'new'
     end
  end

private 

    def user_params
       params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end
    
    def signed_in_user
        #store_location
        #redirect_to signin_url, notice: "PLease sign in." unless signed_in?
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(current_user, :notice => "You tried to access a wrong link, please try again!") unless current_user?(@user)
    end
end
