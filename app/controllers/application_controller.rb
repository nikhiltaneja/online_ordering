class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def viewable_restaurants
    Restaurant.where(display:true)
  end

end
