class CustomerController < ApplicationController
  def index
    @users = current_restaurant.customers
  end
end
