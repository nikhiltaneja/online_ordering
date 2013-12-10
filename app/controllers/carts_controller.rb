class CartsController < ApplicationController

  def show
    unless order
      flash.notice = "You must add an item before viewing your cart"
      redirect_to categories_path
    end
  end

  private

  def order
    @order ||= if current_user && current_user.current_order
      current_user.current_order
    elsif session[:order_id]
      Order.find(session[:order_id])
    end
  end
end
