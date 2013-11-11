class AdminController < ApplicationController

  def show
    @orders = Order.all 
  end
  
end
