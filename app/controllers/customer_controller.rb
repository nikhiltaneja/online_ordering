class CustomerController < ApplicationController
  def index
    @users = current_restaurant.orders.includes(:user).map(&:user).uniq.reject{|user|user.nil?}
  end
end
