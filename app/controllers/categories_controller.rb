class CategoriesController < ApplicationController
  def index

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
