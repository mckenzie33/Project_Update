class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      flash[:success] = "Welcome to Honda Materials"
      redirect_back_or @user
    #redirect to user
    else
      flash.now[:error] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
