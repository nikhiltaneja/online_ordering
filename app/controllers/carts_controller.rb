class CartsController < ApplicationController

  def show
    if session[:order_id]  
      @order = Order.find(session[:order_id])
    else
      flash.notice = "You must add an item before viewing your cart"
      redirect_to categories_path
    end
  end

end
