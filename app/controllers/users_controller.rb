class UsersController < ApplicationController

  def show
    unless current_user
      redirect_to root_path
    else
      @user = current_user
      @orders = current_user.orders
    end
  end
end
