class CheckoutController < ApplicationController
  before_filter :authenticate_user!, only: [:show]

  def show
    @order = Order.find(session[:order_id])
  end
end
