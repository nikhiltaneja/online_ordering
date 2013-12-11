class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def viewable_restaurants
    return Restaurant.all if current_user && current_user.platform_admin
    
    Restaurant.where(display:true)
  end

end
