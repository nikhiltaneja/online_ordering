class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def viewable_restaurants
    return Restaurant.all.order(:id) if platform_admin?
    Restaurant.where(display:true).order(:id)
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
    
    # if current_order && current_order.restaurant == current_restaurant
    #   session[:order_id] = current_order.id
    # else
    #   session[:order_id] = nil
    # end

  end
  helper_method :current_order
end
