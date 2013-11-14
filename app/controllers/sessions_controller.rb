class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by_auth(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to cart_path, notice: "Logged in as #{@user.name}"
  

  end

  def destroy
    session.delete(:user_id)
    session.delete(:order_id)
    redirect_to categories_path, notice: "You are now logged out!"
  end

end
