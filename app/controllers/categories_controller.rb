class CategoriesController < ApplicationController
  def index
    @restaurant = Restaurant.find_by(slug: params[:slug])
    roles = Role.where(restaurant: @restaurant)
    @admins = roles.where(level: "admin")
    @stockers = roles.where(level: "stocker")
    @categories = Category.all
  end
end
