class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create!(restaurant_params)
    render :restaurant_confirmation
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :description)
    end

end
