class AdminController < ApplicationController

before_action :check_admin

  def index
    @orders = current_restaurant.orders.includes(:user).where("orders.user_id IS NOT NULL")
    #@orders = current_restaurant.orders.includes(:user)
    #@users = @orders.map(&:user).uniq.reject{|user|user.nil?}
    @users = @orders.map(&:user).uniq
    @item_count = current_restaurant.categories.joins(:items).count
    @total_sales = @orders.where(:status=>"complete").joins(:order_items).joins(:items).sum("order_items.quantity * items.price")
  end

  private

  def check_admin
    unless current_user && current_user.roles.include? { |role| role.level == "admin" }
      # redirect_to "/#{current_restaurant.slug}", notice: "Sorry, you must be an admin to access that page"
      redirect_to home_path(slug: current_restaurant.slug), notice: "Sorry, you must be an admin to access that page"
    end
  end

end
