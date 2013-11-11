class CartsController < ApplicationController

  def show    
     @order = Order.find(session[:order_id])
  end

end
