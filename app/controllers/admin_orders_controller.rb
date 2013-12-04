class AdminOrdersController < ApplicationController
  before_action :can_access

  def index
    if params[:order_by] == 'ascending'
      @orders = Order.order(:status)
      @order_by = 'descending'
    else
      @orders = Order.order('status DESC')
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
