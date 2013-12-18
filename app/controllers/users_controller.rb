class UsersController < ApplicationController

  def show
    if current_user.nil?
      redirect_to root_path
    else
      @user = current_user
      @orders = current_user.orders
    end
  end
end
