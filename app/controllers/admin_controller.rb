class AdminController < ApplicationController

  def index
    @orders = Order.all 
    @users = User.all
    @items = Item.all
    @order_items = OrderItem.all
  end
  
end
