class AdminController < ApplicationController

before_action :check_admin

  def index
    @orders = current_restaurant.orders
    @order_count = current_restaurant.order_count
    @users = current_restaurant.customers
    @user_count = current_restaurant.customer_count
    @item_count = current_restaurant.item_count
    @total_sales = current_restaurant.total_sales
  end

  private

  def check_admin
    unless current_user && restaurant_admin?
      # redirect_to "/#{current_restaurant.slug}", notice: "Sorry, you must be an admin to access that page"
      redirect_to home_path(slug: current_restaurant.slug), notice: "Sorry, you must be an admin to access that page"
    end
  end

end
