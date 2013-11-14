class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def authenticate
    redirect_to login_path unless session[:user_id]
  end

private
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def can_access
    unless admin?
      flash.notice = "If you are an Admin, please login. Otherwise, Sorry bro."
      redirect_to categories_path
    end
  end
  
  def admin?
    if current_user
      current_user.admin?
    else
      false
    end
  end

end
