class CustomerController < ApplicationController

  def index
    @users = User.all
  end
end
