class OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
    else
      @orders = []
    end
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
