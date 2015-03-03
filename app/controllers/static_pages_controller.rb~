class StaticPagesController < ApplicationController
  def home
   if signed_in?
    @user = User.new
    @activity = current_user.activities.build
    @log_items = current_user.log.paginate(page: params[:page])
   end 
  end

  def help
  end

  def about
  end

  def calories
  end
  
  def graph
  end

  def temp
	@users = User.all
  end

end
