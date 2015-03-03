module SessionsHelper
def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

def signed_in?
    !current_user.nil?
  end

def current_user=(user)
    @current_user = user
end

def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
end

def current_user?(user)
    user == current_user
end

def is_admin?
    (current_user.id == 1) or (current_user.id == 14)
end

def is_group_admin?
	#@admin_of = Group.where(:owner_id => current_user.id)
	#@admin_of.count > 0
	(current_user.id == 1) or (current_user.id == 2) or (current_user.id == 13)
end

def user_groups
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
    @memberships = Membership.find(:all, :conditions => [ "user_id = ?", @current_user.id])
end

def signed_in_user
    unless signed_in?
    store_location
    redirect_to signin_url, notice: "Please sign in."
    end
end

def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
end

def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
end

def store_location
    session[:return_to] = request.url if request.get?
end
end
