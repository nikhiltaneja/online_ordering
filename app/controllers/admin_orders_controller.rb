class AdminOrdersController < ApplicationController

  def index
    if params[:filter_by] == 'Complete'
      @orders = Order.where(restaurant: current_restaurant).where(status: 'complete')
      @filter_by = 'Incomplete'
    elsif params[:filter_by] == 'Incomplete'
      @orders = Order.where(restaurant: current_restaurant).where(status: 'incomplete')
      @filter_by = 'Complete'
    else
      @orders = Order.where(restaurant: current_restaurant)
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
