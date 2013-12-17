class CategoriesController < ApplicationController
  def index

    unless Restaurant.find_by(slug: params[:slug]).display
      flash.alert = "Restaurant isn't available."
      redirect_to root_path
    end

    roles = current_restaurant.roles.includes(:user)
    @admins = roles.where(level: "admin").map(&:user)
    @admins = roles.where(level: "stocker").map(&:user)
    @categories = current_restaurant.categories
  end

end
