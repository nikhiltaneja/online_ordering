class CustomerController < ApplicationController
  before_action :check_admin
  def index
    @users = current_restaurant.customers
  end
end
