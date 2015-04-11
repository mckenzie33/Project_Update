class StaticPagesController < ApplicationController
  def home
  	@dpm_data = {1=>0.1, 2=>0.2, 3=>0.4, 4=>0.2, 5=>0.1}
   if signed_in?
    @user = User.new
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
