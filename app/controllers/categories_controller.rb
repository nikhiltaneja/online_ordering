class CategoriesController < ApplicationController
  def index
    unless Restaurant.find_by(slug: params[:slug]).display
      flash.alert = "Restaurant isn't available."
      redirect_to root_path
    end

    @categories = current_restaurant.categories

    if params[:filter].nil?
      @category_filter = current_restaurant.categories
    else
      @category_filter = current_restaurant.category(params[:filter])
    end

    @restaurant = current_restaurant
    #roles = current_restaurant.roles.includes(:user)
    #@admins = roles.where(level: "admin").map(&:user)
    #@stocker = roles.where(level: "stocker").map(&:user)
  end
end
