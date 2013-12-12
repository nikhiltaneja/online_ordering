class RestaurantsController < ApplicationController
  def index
    @restaurants = viewable_restaurants
  end

  def show
    @restaurant = Restaurant.find_by(slug:params[:slug])
    redirect_to categories_path(@restaurant)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create!(restaurant_params)
    Role.create!(restaurant: @restaurant, user: current_user, level: "admin")
    render :restaurant_confirmation
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @user = @restaurant.roles.first.user

    if params[:status]
      @restaurant.status = params[:status]
      if params[:status] == 'approved' 
        UserMailer.approved_confirmation(@user, @restaurant).deliver
      end
      if params[:status] == 'rejected' 
        UserMailer.rejected_confirmation(@user, @restaurant).deliver
      end
    end

    if params[:display]
      @restaurant.display = params[:display]
    end

    @restaurant.save
    redirect_to root_path
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :status)
    end
end
