class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def viewable_restaurants
    return Restaurant.all if platform_admin?
    Restaurant.where(display:true)
  end

  def platform_admin?
    current_user && current_user.platform_admin
  end
  helper_method :platform_admin?

  def current_restaurant
    @current_restaurant ||= Restaurant.find_by(slug: request.original_fullpath.split("/")[1])
  end

  helper_method :current_restaurant
end
