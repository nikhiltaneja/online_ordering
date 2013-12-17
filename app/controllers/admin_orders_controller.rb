class AdminOrdersController < ApplicationController

  def index
    if params[:order_by] == 'ascending'
      @orders = Order.where(restaurant: current_restaurant).order(:status)
      @order_by = 'descending'
    else
      @orders = Order.order('status DESC')
      @orders = Order.where(restaurant: current_restaurant).order('status DESC')
      @order_by = 'ascending'
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
