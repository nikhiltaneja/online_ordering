class CartsController < ApplicationController

  def show    
    unless order
      flash.notice = "You must add an item before viewing your cart"
      redirect_to categories_path
    end
  end

  def index
    unless order
      flash.notice = "You must add an item before viewing your cart"
      redirect_to categories_path
    end
  end

  private

  def order
    # @order ||= if current_user && current_order.user
    #   if current_restaurant.orders.where(user: current_user).last.status == "incomplete"
    #     current_restaurant.orders.where(user: current_user).last
    #   end
    @order = current_order
  end
end
