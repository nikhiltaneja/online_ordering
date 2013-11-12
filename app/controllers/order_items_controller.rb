require './app/models/order'

class OrderItemsController < ApplicationController

  def create
    order = find_or_create_order
    order.add_item(params[:order_item])
    order.save

    item = Item.find(params[:order_item][:item_id])
    flash.notice = "Added #{params[:order_item][:quantity]} #{item.name} to your order!"
    redirect_to categories_path
  end

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(:quantity => params[:order_item][:quantity])
    redirect_to cart_path
  end

  def find_or_create_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      order = Order.create(:status => "incomplete", :user => current_user)
      session[:order_id] = order.id
      order
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    session.delete(:item_id)

    flash.notice = "Item Removed from Cart!"

    redirect_to :back
  end
end
