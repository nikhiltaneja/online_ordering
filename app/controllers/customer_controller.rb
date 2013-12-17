class CustomerController < ApplicationController

  def index
    @users = Order.where(restaurant: current_restaurant).includes(:users).map(&:user)
  end
end
