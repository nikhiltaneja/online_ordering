class ThankYouController < ApplicationController

  def show
    @order = Order.find(session[:order_id])
    @order.checkout
    session[:order_id] = nil
  end

end
