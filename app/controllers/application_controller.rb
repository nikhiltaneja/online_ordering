class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  after_filter :store_location

  def store_location
    if (request.fullpath != "/users/sign_in" &&
        request.fullpath != "/users/sign_up" &&
        request.fullpath != "/users/password" &&
        request.fullpath != "/login" &&
        request.fullpath != "/logout" &&
        request.fullpath != "/restaurants/new" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def after_sign_out_path_for(resource)
    session[:previous_url] || root_path
  end

  def viewable_restaurants
    return Restaurant.all.order(:id) if platform_admin?
    Restaurant.where(display:true).order(:id)
  end

  def regions_with_restaurants
    Region.includes(:restaurants)
  end

  def platform_admin?
    current_user && current_user.platform_admin
  end
  helper_method :platform_admin?

  def current_restaurant
    @current_restaurant ||= Restaurant.find_by(slug: request.original_fullpath.split("/")[1])
  end
  helper_method :current_restaurant

  def current_order
    if session[:order_id]
      if current_restaurant.id == Order.find(session[:order_id]).restaurant.id
        Order.find(session[:order_id])
      else
        session[:order_id] = nil
      end
    else
      if Order.where(restaurant: current_restaurant).last && Order.where(restaurant: current_restaurant).last.incomplete?
        Order.where(restaurant: current_restaurant).last
      end
    end
  end
  helper_method :current_order
end
