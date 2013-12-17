class CategoriesController < ApplicationController
  def index

    unless Restaurant.find_by(slug: params[:slug]).display
      flash.alert = "Restaurant isn't available."
      redirect_to root_path
    end

    @restaurant = current_restaurant

    roles = Role.where(restaurant: @restaurant)
    @admins = roles.where(level: "admin").map do |role|
      role.user
    end
    @stockers = roles.where(level: "stocker").map do |role|
      role.user
    end
    @categories = @restaurant.categories

    # if params[:order]
    #   @order = Order.find(params[:order])
    # end
  end

end
