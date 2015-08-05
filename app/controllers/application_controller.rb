class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

# this is preventing our list items from saving
  # protect_from_forgery with: :exception

  before_action :current_user
  before_action :group
  before_action :list
  before_action :new_list


# ============================================
# ==== LOCAL LOGIN AND SECURITY METHODS ======
# ============================================
  def confirm_logged_in
    unless session[:user_id]
      redirect_to login_path, alert: "Please log in"
    end
  end

  def confirm_admin
     unless current_user.is_admin
       redirect_to groups_path, alert: "You must be an admin to perform that action."
     end
  end

  # Stop a logged in user from going to the sign up page
  def prevent_login_signup
    if session[:user_id]
      redirect_to :back, notice: "You are already logged in"
      # what do you think redirect_to :back does?
    end
  end

  def ensure_correct_user
    unless params[:id] == session[:id]
      redirect_to login_path, flash: {alert: "Not Authorized"}
    end
  end

  def current_user
  # Let's not make a database query if we don't need to!
   return unless session[:user_id]
  # Defines @current_user if it is not already defined.
   @current_user ||= User.find_by_id(session[:user_id])
  end

# ==================================================
# ==== MAKES @group, @list, and group.lists? ACCESSIBLE FROM EVERY PAGE =====
# ==================================================
# this way we can create a new group, and redirect to the groups page from the nav bar
  def group
    Group.new
  end
    
  def list
    @list = List.new
  end

  def new_list
    group.lists.new
  end

  helper_method :current_user, :group, :list, :new_list #make it available in views (it will be available in all controllers as well

end
