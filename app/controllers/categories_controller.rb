class CategoriesController < ApplicationController
  def index
    @restaurant = Restaurant.find_by(slug:params[:slug])
    @categories = Category.all
  end
end
