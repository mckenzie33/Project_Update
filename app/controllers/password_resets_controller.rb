class PasswordResetsController < ApplicationController
  def new
  end
  #This will send an email to the user when they ask to reset their password
  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to signin_path, :notice => "#{edit_password_reset_url(user.password_reset_token)}"
  end
  def edit
  @user = User.find_by_password_reset_token!(params[:id])
  end
  
  def update
  @user = User.find_by_password_reset_token!(params[:id])
  if @user.password_reset_sent_at < 2.hours.ago
    redirect_to new_password_reset_path, :alert => "Password reset has expired."
  elsif @user.update_attributes(params[:user])
    redirect_to signin_path, :notice => "Password has been reset!"
  else
    render :edit
  end
  end

end
