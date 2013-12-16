class CheckoutController < ApplicationController

  def show
    @order = current_order
  end
end
