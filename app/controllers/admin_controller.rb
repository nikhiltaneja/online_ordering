class AdminController < ApplicationController
  before_action :can_access

  def index
    @orders = Order.all
    @users = User.all
    @items = Item.all
    @order_items = OrderItem.all
    @total_sales = total_sales
  end

  def total_sales
    completed_orders = Order.where(:status => 'complete')
    completed_orders.collect do |order|
        order.total_price
      end.reduce(:+)
  end

end
