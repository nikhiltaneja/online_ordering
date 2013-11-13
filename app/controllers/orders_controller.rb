class OrdersController < ApplicationController

  def index
    if current_user
      if current_user.orders.any?
        @completed_orders = completed_orders.to_a
      else
        no_orders_redirect
      end
    else
      no_orders_redirect
    end
  end

  def no_orders_redirect
    flash.notice = "You do not have any orders. Time to remedy that."
    redirect_to categories_path
  end

  def show
    @order = Order.find(params[:id])
  end

  def completed_orders
    Order.where(:user_id => session[:user_id], :status => "complete")
  end

end
