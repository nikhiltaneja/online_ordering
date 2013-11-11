class OrdersController < ApplicationController

  def index
    @completed_orders = completed_orders.to_a
  end

  def show
    @order = Order.find(params[:id])
  end

  def completed_orders
    Order.where(:user_id => session[:user_id], :status => "complete")
  end

end
