class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def no_orders_redirect
    flash.notice = "You do not have any orders. Time to remedy that."
    redirect_to categories_path
  end

  def show
    @order = current_user.find_order(params[:id])
  end

  #def completed_orders
  #  Order.where(:user_id => session[:user_id], :status => "complete")
  #end
end
