class RestaurantsController < ApplicationController
  def home
  end

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
    UserMailer.notify_restaurant_admin(current_user, @restaurant).deliver
    UserMailer.notify_platform_admin(PlatformAdmin.first.user, @restaurant).deliver
    render :restaurant_confirmation
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant_admin = @restaurant.roles.first.user

    if params[:status]
      @restaurant.status = params[:status]
      if params[:status] == 'approved'
        UserMailer.approved_confirmation(@restaurant_admin, @restaurant).deliver
        UserMailer.admin_approved_confirmation(current_user, @restaurant).deliver
      end
      if params[:status] == 'rejected'
        UserMailer.rejected_confirmation(@restaurant_admin, @restaurant).deliver
        UserMailer.admin_rejected_confirmation(current_user, @restaurant).deliver
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
