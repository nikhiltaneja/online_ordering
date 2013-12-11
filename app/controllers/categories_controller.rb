class CategoriesController < ApplicationController
  def index
    @restaurant = Restaurant.find_by(slug: params[:slug])
    role = Role.where(restaurant_id: @restaurant.id)
    puts '******************************'
    puts role.first.user_id.inspect
    puts '******************************'
    @admin = User.find(role.first.user_id)

    @categories = Category.all
  end
end
