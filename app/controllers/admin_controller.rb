class AdminController < ApplicationController

  def index
    @orders ||= Order.where(restaurant_id: current_restaurant.id)
    @users ||= @orders.map{ |order| order.user }
    @items ||= Category.where(restaurant_id: current_restaurant.id).map{ |category| category.items}.flatten
    @total_sales ||= total_sales
  end

  def total_sales
    completed_orders ||= @orders.where(:status => 'complete')
    completed_orders.collect do |order|
        order.total_price
      end.reduce(:+)
  end

end
