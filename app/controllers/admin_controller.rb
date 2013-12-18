class AdminController < ApplicationController

  def index
    @orders = current_restaurant.orders.includes(:user).where("orders.user_id IS NOT NULL")
    #@orders = current_restaurant.orders.includes(:user)
    #@users = @orders.map(&:user).uniq.reject{|user|user.nil?}
    users = @orders.map(&:user).uniq
    @item_count = current_restaurant.categories.joins(:items).count
    @total_sales = @orders.where(:status=>"complete").joins(:order_items).joins(:items).sum("order_items.quantity * items.price")
  end

end
