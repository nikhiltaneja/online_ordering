class CustomerController < ApplicationController

  def index
    @users = Order.where(restaurant: current_restaurant).each_with_object([]) do |order, users|
      unless order.user_id.nil?  
        users << User.find(order.user_id)
      end
    end
  end
end
