class ThankYouController < ApplicationController

  def show
    @order = current_order
    @order.checkout
    session[:order_id] = nil
  end

end
