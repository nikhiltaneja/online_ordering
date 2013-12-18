class AdminController < ApplicationController

  def index
    @orders = current_restaurant.orders
    @order_count = current_restaurant.order_count
    @users = current_restaurant.customers
    @item_count = current_restaurant.item_count
    @total_sales = current_restaurant.total_sales
  end

end
