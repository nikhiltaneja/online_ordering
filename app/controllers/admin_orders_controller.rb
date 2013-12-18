class AdminOrdersController < ApplicationController

  def index
    if params[:filter_by] == 'Complete'
      @orders = current_restaurant.complete_orders
      @filter_by = 'Incomplete'
    elsif params[:filter_by] == 'Incomplete'
      @orders = current_restaurant.incomplete_orders
      @filter_by = 'Complete'
    else
      @orders = current_restaurant.orders
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    flash.notice = "Order number #{@order.id} removed!"

    redirect_to admin_orders_path
  end

end
